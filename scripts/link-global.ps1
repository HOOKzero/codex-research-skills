[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [switch]$BackupExisting
)
$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
$srcRoot = Join-Path $repoRoot 'skills'
$destRoot = Join-Path $HOME '.agents\skills'
$backupRoot = Join-Path $HOME '.skill-backups\codex-research-skills'
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'

New-Item -ItemType Directory -Force -Path $destRoot | Out-Null

foreach ($dir in (Get-ChildItem -LiteralPath $srcRoot -Directory)) {
    $src = $dir.FullName
    $dest = Join-Path $destRoot $dir.Name

    if (Test-Path -LiteralPath $dest) {
        $existing = Get-Item -LiteralPath $dest -Force
        $linkTargets = @($existing.Target | Where-Object { $_ })
        if (($existing.Attributes -band [IO.FileAttributes]::ReparsePoint) -and
            ($linkTargets | Where-Object { [string]::Equals(
                [IO.Path]::GetFullPath([string]$_).TrimEnd('\'),
                [IO.Path]::GetFullPath($src).TrimEnd('\'),
                [StringComparison]::OrdinalIgnoreCase
            ) })) {
            Write-Host "Already linked: $($dir.Name)"
            continue
        }

        if (-not $BackupExisting) {
            throw "Existing skill at $dest. Use -BackupExisting to move it out of the skill directory first."
        }
        $backup = Join-Path (Join-Path $backupRoot $stamp) $dir.Name
        if ($PSCmdlet.ShouldProcess($dest, "Back up existing skill to $backup")) {
            New-Item -ItemType Directory -Force -Path (Split-Path -Parent $backup) | Out-Null
            Move-Item -LiteralPath $dest -Destination $backup
            Write-Host "Backed up: $backup"
        }
    }

    if ($PSCmdlet.ShouldProcess($dest, "Create junction -> $src")) {
        New-Item -ItemType Junction -Path $dest -Target $src | Out-Null
        Write-Host "Linked: $($dir.Name) -> $src"
    }
}
Write-Host 'Restart Codex if the updated skills do not appear.'
