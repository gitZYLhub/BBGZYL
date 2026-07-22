[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

$workspace = Split-Path -Parent $PSScriptRoot
$modInfoPath = Join-Path $workspace 'ZYL_LightweightBalance\ZYL_LightweightBalance.modinfo'

if (-not (Test-Path -LiteralPath $modInfoPath)) {
	throw "Mod metadata file not found: $modInfoPath"
}

[xml]$modInfo = Get-Content -LiteralPath $modInfoPath -Raw -Encoding UTF8
$properties = $modInfo.Mod.Properties
$expected = [ordered]@{
	Name = 'ZYL Lightweight Balance Mod'
	Description = 'Lightweight Civilization VI balance changes for friendly multiplayer games.'
	Teaser = 'Lightweight multiplayer balance tweaks.'
}

foreach ($field in $expected.Keys) {
	$value = [string]$properties.$field
	if ($value -ne $expected[$field]) {
		throw "$field must be exactly '$($expected[$field])'; found '$value'."
	}
	if ($value -match 'LOC_') {
		throw "$field must not contain a localization key: $value"
	}
	if ($value.ToCharArray() | Where-Object { [int]$_ -gt 127 }) {
		throw "$field must contain ASCII characters only: $value"
	}
}

Write-Output 'PASS: Workshop-facing Name, Description, and Teaser are exact ASCII literals.'
Write-Output "Title: $($properties.Name)"
Write-Output "Description: $($properties.Description)"
