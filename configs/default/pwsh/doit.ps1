$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'
$PSNativeCommandUseErrorActionPreference = $true

$Modules = @(
    'powershell-yaml'
    'az'
)

$Env:BS_SECTION_CHAR * $Host.UI.RawUI.WindowSize.Width 
"Intalling modules..."

$Modules | ForEach-Object {
    "+ Installing $_"
    Install-Module -Name $_ -Force
    "+ Installing $_✔️"
}
"Intalling modules✔️"


