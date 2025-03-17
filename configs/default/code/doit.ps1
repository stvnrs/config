#requires -modules pave-logger
#requires -modules pave-utils

$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'
$PSNativeCommandUseErrorActionPreference = $true


#region config
$Proxy = Get-Proxy 'https://dev.azure.com/'
$SettingsPath = "$Env:APPDATA/Code/User"
$SettingsFilePath = "$SettingsPath/settings.json"

$Settings = @"
{
    "http.proxySupport": "on",
    "http.proxy": "$Proxy",
    "http.proxyStrictSSL": false,
    "http.proxyAuthorization": null,
    "window.zoomLevel": 0.4,
    "workbench.colorTheme": "$env:CODE_INSIDERS_THEME",
    "terminal.integrated.profiles.windows": {
        "PowerShell": {
            "path": "pwsh.exe",
            "icon": "terminal-powershell"
        },
        "Command Prompt": {
            "path": [
                "$($env:windir -replace '\\', '\\')\\System32\\cmd.exe"
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
        "pwsh": "$env:PWSH_DEFAULT_PATH"
    }
}
"@

$Extensions = @(
    'GitHub.remotehub'
    'mechatroner.rainbow-csv'
    'ms-dotnettools.vscode-dotnet-runtime'
    'ms-toolsai.datawrangler'
    'ms-vscode.azure-repos'
    'ms-vscode.hexeditor'
    'ms-vscode.powershell'
    'ms-vscode.remote-repositories'
)
#endregion

#region settings
Push-LogAction "Deploying settings"

if(!(Test-Path $SettingsPath)){
    mkdir $SettingsPath
}

$Settings | Out-File $SettingsFilePath  

Pop-LogAction
#endregion

#region keybindings
Push-LogAction "Deploying key bindings"

$KeyBindingsName = 'keybindings.json'
$KeyBindingsFilePathSource = Join-Path $PSScriptRoot $KeyBindingsName 
$KeyBindingsFilePathTarget = Join-Path $SettingsPath $KeyBindingsName 
cp $KeyBindingsFilePathSource $KeyBindingsFilePathTarget 

Pop-LogAction
#endregion

#region extensions
Push-LogAction "Installing extensions"

$Extensions | ForEach-Object {
    code-insiders --install-extension $_
}

Pop-LogAction
#endregion
