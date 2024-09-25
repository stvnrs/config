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

if (!$SkipTerminal.IsPresent) {
    & "$PSScriptRoot/terminal/doit.ps1" 
}

if (!$SkipCodeInsiders.IsPresent) {
    & "$PSScriptRoot/code-insiders/doit.ps1" 
}

if (!$SkipStorageExploer.IsPresent) {
 & "$PSScriptRoot/azure-storage-explorer/doit.ps1"
}

if (!$SkipGit.IsPresent) {
    & "$PSScriptRoot/git/doit.ps1" 
}

if (!$SkipPwsh.IsPresent) {
    & "$PSScriptRoot/pwsh/doit.ps1" 
}
