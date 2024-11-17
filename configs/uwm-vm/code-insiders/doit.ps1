$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'


$Proxy = ([System.Net.WebRequest]::GetSystemWebProxy().GetProxy('https://marketplace.visualstudio.com/')).OriginalString

"Deploying settings..."

$Settings = @"
{
    "http.proxySupport": "on",
    "http.proxy": "$Proxy",
    "http.proxtStrictSSL": "false",
    "http.proxyAuthorization": null,
    "window.zoomLevel": 0.4,
    "workbench.colorTheme": "Solarized Dark"
}
"@

"Deploying settings✔️"

$SettingsPath = "$Env:APPDATA/Code - Insiders/User"
$SettingsFilePath = "$SettingsPath/settings.json"

if(!(Test-Path $SettingsPath)){
    mkdir $SettingsPath
}

$Settings | Out-File $SettingsFilePath  

$Env:BS_SECTION_CHAR * $Host.UI.RawUI.WindowSize.Width 
"Installing extensions..."

$Extensions = @(
    'GitHub.remotehub'
    'mechatroner.rainbow-csv'
    'ms-azure-devops.azure-pipelines'
    'ms-azuretools.vscode-azurefunctions'
    'ms-azuretools.vscode-azureresourcegroups'
    'ms-azuretools.vscode-bicep'
    'ms-dotnettools.vscode-dotnet-runtime'
    'ms-python.python' 
    'ms-toolsai.datawrangler'
    'ms-toolsai.jupyter'
    'ms-vscode.azure-repos'
    'ms-vscode.hexeditor'
    'ms-vscode.powershell'
    'ms-vscode.remote-repositories'
)

$Extensions | ForEach-Object {
    code-insiders --install-extension $_
}

"Installing extensions✔️"
