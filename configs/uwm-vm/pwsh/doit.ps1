$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'
$PSNativeCommandUseErrorActionPreference = $true

$Proxy = ([System.Net.WebRequest]::GetSystemWebProxy().GetProxy('https://www.powershellgallery.com/')).OriginalString

$Modules = @(
    'az'
    'powershell-yaml'
    'psduckdb'
    'Microsoft.Graph'
)

$Env:BS_SECTION_CHAR * $Host.UI.RawUI.WindowSize.Width 
"Intalling modules..."

$Modules | ForEach-Object {
    "+ Installing $_"
    Install-Module -Name $_ -Force
    "+ Installing $_✔️"
}
"Intalling modules✔️"
