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
    if(Get-Module -ListAvailable $_){
        "+ $_ is already installed"
    } else {
        Install-Module -Name $_ -Force
    }

    "+ Installing $_✔️"
}
"Intalling modules✔️"


