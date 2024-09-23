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

$SettingsPath = "$Env:APPDATA/Code - Insiders/User"
$SettingsFilePath = "$SettingsPath/settings.json"

if(!(Test-Path $SettingsPath)){
    mkdir $SettingsPath
}

$Settings | Out-File $SettingsFilePath  

$Extensions = @(
    'ms-vscode.powershell'
    'mechatroner.rainbow-csv'
    'GitHub.remotehub'
    'ms-vscode.azure-repos'
    'ms-vscode.remote-repositories'
    'ms-azure-devops.azure-pipelines'
    'ms-toolsai.jupyter'
    'ms-python.python' 
    'ms-azuretools.vscode-bicep'
    'ms-dotnettools.vscode-dotnet-runtime'
    'ms-azuretools.vscode-azureresourcegroups'
    'ms-azuretools.vscode-azurefunctions'
)

$Extensions | ForEach-Object {
    code-insiders --install-extension $_
}