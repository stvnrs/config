#requires -modules pave-logger
#requires -modules pave-utils

$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'
$PSNativeCommandUseErrorActionPreference = $true

Push-LogAction "Setting env"

Add-UserEnvVar -Name 'CODE_INSIDERS_THEME' -Value 'Solarized Dark'

Pop-Location