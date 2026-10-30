[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [ValidateSet('User', 'Project')]
    [string]$Scope = 'User',

    [string]$ProjectPath = '',

    [ValidateSet('Agents', 'LegacyCodex')]
    [string]$Layout = 'Agents',

    [string[]]$SkillNames = @('token-efficient-coding', 'research-coding', 'paper-reproduction', 'windows-desktop-ui'),

    [switch]$Backup,
    [switch]$Force
)

$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
$sourceRoot = Join-Path $repoRoot 'skills'

if ($Scope -eq 'User') {
    if ($Layout -eq 'LegacyCodex') {
        throw 'LegacyCodex layout is only supported for Project scope. Use -Scope Project -ProjectPath ...'
    }
    $destinationRoot = Join-Path $HOME '.agents\skills'
    $backupRoot = Join-Path $HOME '.skill-backups\codex-research-skills'
} else {
    if ([string]::IsNullOrWhiteSpace($ProjectPath)) {
        throw 'Project scope requires -ProjectPath.'
    }
    $projectRoot = (Resolve-Path -LiteralPath $ProjectPath).Path
    if ($Layout -eq 'LegacyCodex') {
        $destinationRoot = Join-Path $projectRoot '.codex\skills'
    } else {
        $destinationRoot = Join-Path $projectRoot '.agents\skills'
    }
    $backupRoot = Join-Path $projectRoot '.skill-backups\codex-research-skills'
}

# Validate everything before changing a destination.
$skillNames = @($SkillNames | Select-Object -Unique)
$allowed = @(Get-ChildItem -LiteralPath $sourceRoot -Directory | ForEach-Object { $_.Name })
foreach ($name in $skillNames) {
    if ($name -notin $allowed) { throw "Unknown skill '$name'. Available: $($allowed -join ', ')" }
    $skillSource = Join-Path $sourceRoot $name
    if (-not (Test-Path -LiteralPath (Join-Path $skillSource 'SKILL.md'))) {
        throw "SKILL.md missing for $name"
    }
    if ((Test-Path -LiteralPath (Join-Path $destinationRoot $name)) -and (-not $Force)) {
        throw "Skill '$name' exists in $destinationRoot. Re-run with -Force (and preferably -Backup)."
    }
}

$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
foreach ($name in $skillNames) {
    $src = Join-Path $sourceRoot $name
    $dst = Join-Path $destinationRoot $name
    if (-not $PSCmdlet.ShouldProcess($dst, "Install $name from $src")) { continue }

    if ((Test-Path -LiteralPath $dst) -and $Backup) {
        $backupParent = Join-Path $backupRoot $stamp
        $backupDestination = Join-Path $backupParent $name
        New-Item -ItemType Directory -Path $backupParent -Force | Out-Null
        Copy-Item -LiteralPath $dst -Destination $backupDestination -Recurse -Force
        Write-Host "Backup: $backupDestination"
    }

    New-Item -ItemType Directory -Path $dst -Force | Out-Null
    foreach ($file in (Get-ChildItem -LiteralPath $src -Recurse -File)) {
        $relative = $file.FullName.Substring($src.Length) -replace '^[\\/]+', ''
        $dstFile = Join-Path $dst $relative
        New-Item -ItemType Directory -Path (Split-Path -Path $dstFile -Parent) -Force | Out-Null
        Copy-Item -LiteralPath $file.FullName -Destination $dstFile -Force
    }
    $versionMatch = Select-String -LiteralPath (Join-Path $dst 'SKILL.md') -Pattern '^\s*version:\s*["'']?([^"''\s]+)' | Select-Object -First 1
    $version = if ($null -ne $versionMatch) { $versionMatch.Matches[0].Groups[1].Value } else { 'unknown' }
    Write-Host "Installed: $name v$version -> $dst"
}
Write-Host 'Verify in a NEW Codex session with /skills and an explicit $skill-name invocation.'
