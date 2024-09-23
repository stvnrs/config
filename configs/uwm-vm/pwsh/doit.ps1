$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'
$PSNativeCommandUseErrorActionPreference = $true

$Proxy = ([System.Net.WebRequest]::GetSystemWebProxy().GetProxy('https://www.powershellgallery.com/')).OriginalString

$Modules = @(
    'az'
    'powershell-yaml'
    'psduckdb'
)

$Modules | ForEach-Object {
    Install-Module -Name $_ -Force
}