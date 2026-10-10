[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
$root = Join-Path $repoRoot 'skills'
$names = @{}
$valid = 0
foreach ($dir in (Get-ChildItem -LiteralPath $root -Directory)) {
    $skillPath = Join-Path $dir.FullName 'SKILL.md'
    if (-not (Test-Path -LiteralPath $skillPath)) { throw "Missing SKILL.md: $($dir.Name)" }
    $content = Get-Content -LiteralPath $skillPath -Raw -Encoding UTF8
    $frontMatter = [regex]::Match($content, '\A---\r?\n(?<fm>[\s\S]*?)\r?\n---\r?\n')
    if (-not $frontMatter.Success) { throw "Invalid YAML front matter: $skillPath" }
    $fm = $frontMatter.Groups['fm'].Value
    $nameMatch = [regex]::Match($fm, '(?m)^name:\s*([a-z0-9-]+)\s*$')
    if (-not $nameMatch.Success) { throw "Missing or invalid name: $skillPath" }
    $name = $nameMatch.Groups[1].Value
    if ($name -ne $dir.Name) { throw "Skill name $name differs from directory $($dir.Name)" }
    if ($names.ContainsKey($name)) { throw "Duplicate Skill name: $name" }
    $names[$name] = $true
    if (-not [regex]::IsMatch($fm, '(?m)^description:\s*.+')) { throw "Missing description: $skillPath" }
    if (-not [regex]::IsMatch($fm, '(?m)^\s+version:\s*["'']?[0-9]+\.[0-9]+\.[0-9]+')) {
        throw "Missing semantic metadata version: $skillPath"
    }
    $refs = [regex]::Matches($content, '(?:references|assets)/[A-Za-z0-9_./-]+')
    foreach ($m in $refs) {
        $rel = $m.Value.TrimEnd([char[]]@('.', ',', ';', ')', ']'))
        $refPath = Join-Path $dir.FullName $rel
        if (-not (Test-Path -LiteralPath $refPath)) { throw "Missing local reference $rel in $($dir.Name)" }
    }
    Write-Host "OK: $name"
    $valid++
}
# Validate bundled JSON templates.
Get-ChildItem -LiteralPath $root -Filter '*.json' -Recurse -File | ForEach-Object {
    $null = Get-Content -LiteralPath $_.FullName -Raw -Encoding UTF8 | ConvertFrom-Json
    Write-Host "OK JSON: $($_.Name)"
}
Write-Host "Validated $valid Skill(s)."
