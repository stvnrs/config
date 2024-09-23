param (
    [Switch]
    $SkipTerminal,
    [Switch]
    $SkipCodeInsiders,
    [Switch]
    $SkipStorageExploer,
    [Switch]
    $SkipPython
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

if (!$SkipPython.IsPresent) {
    & "$PSScriptRoot/python/doit.ps1" 
}



