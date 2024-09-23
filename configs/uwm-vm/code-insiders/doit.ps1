$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'


$Proxy = ([System.Net.WebRequest]::GetSystemWebProxy().GetProxy('https://marketplace.visualstudio.com/')).OriginalString

$Settings = @"
{
    "http.proxySupport": "on",
    "http.proxy": "$Proxy",
    "http.proxtStrictSSL": "false",
    "http.proxyAuthorization": null
}
"@

$SettingsFilePath = "$Env:APPDATA/Code - Insiders/User/settings.json"

$Settings | Out-File $SettingsFilePath  

$Extensions = @(
    'ms-toolsai.jupyter'
    'ms-python.python' 
    'mechatroner.rainbow-csv'
)

$Extensions | ForEach-Object {
    code-insiders --install-extension $_
}