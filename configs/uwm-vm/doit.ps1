param (
    [Switch]
    $SkipTerminal,
    [Switch]
    $SkipCodeInsiders,
    [Switch]
    $SkipStorageExploer,
    [Switch]
    $SkipPython,
    [Switch]
    $SkipGit,
    [Switch]
    $SkipPwsh
)

$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'

$Env:BS_HEADER_CHAR = $Env:BS_HEADER_CHAR ?? '*'
$Env:BS_SECTION_CHAR = $Env:BS_FOOTER_CHAR ?? '-'
$Env:BS_FOOTER_CHAR = $Env:BS_FOOTER_CHAR ?? '='
$Env:BS_BLANK_LINES = $Env:BS_BLANK_LINES ?? 1

function DoIt {
    param(
        [string]$Config
    )
    $Env:BS_HEADER_CHAR * $Host.UI.RawUI.WindowSize.Width 
    "Deploying config: $Config"
    & $(Join-Path $PSScriptRoot $Config 'doit.ps1')
    "Deploying config: $Config✔️"
    $Env:BS_FOOTER_CHAR * $Host.UI.RawUI.WindowSize.Width 
    [Environment]::NewLine * $Env:BS_BLANK_LINES
}

if (!$SkipTerminal.IsPresent) {
    DoIt 'Terminal'
}

if (!$SkipCodeInsiders.IsPresent) {
    DoIt 'code-insiders'
}

if (!$SkipStorageExploer.IsPresent) {
    DoIt 'azure-storage-explorer'
}

if (!$SkipGit.IsPresent) {
    DoIt 'git'
}

if (!$SkipPwsh.IsPresent) {
    DoIt 'pwsh'
}