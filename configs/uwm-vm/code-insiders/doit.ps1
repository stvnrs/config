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
    "workbench.colorTheme": "Solarized Dark",
    "terminal.integrated.profiles.windows": {

        "PowerShell": {
            "path": "pwsh.exe",
            "icon": "terminal-powershell"
        },
        "Command Prompt": {
            "path": [
                "${env:windir}\\Sysnative\\cmd.exe",
                "${env:windir}\\System32\\cmd.exe"
            ],
            "args": [],
            "icon": "terminal-cmd"
        },
        "Git Bash": {
            "source": "Git Bash"
        }
    },
    "terminal.integrated.defaultProfile.windows": "PowerShell",
    "powershell.powerShellDefaultVersion": "pwsh",
    "powershell.powerShellAdditionalExePaths": {
        "pwsh": "$($Env:LOCALAPPDATA -replace '\\', '\\')\\powershell\\pwsh.exe"
    }
}
"@

"Deploying settings✔️"

$SettingsPath = "$Env:APPDATA/Code - Insiders/User"
$SettingsFilePath = "$SettingsPath/settings.json"

if(!(Test-Path $SettingsPath)){
    mkdir $SettingsPath
}

$Settings | Out-File $SettingsFilePath  

"Deploying key bindings..."
$KeyBindingsName = 'keybindings.json'
$KeyBindingsFilePathSource = Join-Path $PSScriptRoot $KeyBindingsName 
$KeyBindingsFilePathTarget = Join-Path $SettingsPath $KeyBindingsName 
cp $KeyBindingsFilePathSource $KeyBindingsFilePathTarget 
"Deploying key bindings✔️"

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
