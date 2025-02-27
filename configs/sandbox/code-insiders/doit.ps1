$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'

"Deploying settings..."

$Settings = @"
{
    "window.zoomLevel": 0.4,
    "workbench.colorTheme": "Monokai",
    "terminal.integrated.profiles.windows": {
        "PowerShell": {
            "path": "pwsh.exe",
            "icon": "terminal-powershell"
        },
        "Command Prompt": {
            "path": [
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
        "pwsh": "${Env:PWSH_DEFAULT_PATH}"
    }
}
"@



$SettingsPath = "$Env:APPDATA/Code - Insiders/User"
$SettingsFilePath = "$SettingsPath/settings.json"

if(!(Test-Path $SettingsPath)){
    mkdir $SettingsPath
}

$Settings | Out-File $SettingsFilePath  
"Deploying settings -done!"

"Deploying key bindings..."
$KeyBindingsName = 'keybindings.json'
$KeyBindingsFilePathSource = Join-Path "$PSScriptRoot\..\..\..\shared\code-insiders" $KeyBindingsName 
$KeyBindingsFilePathTarget = Join-Path $SettingsPath $KeyBindingsName 
cp $KeyBindingsFilePathSource $KeyBindingsFilePathTarget 
"Deploying key bindings -done!"

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
    'mvllow.rose-pine'
)

$Extensions | ForEach-Object {
    code-insiders --install-extension $_
}

"Installing extensions - done"
