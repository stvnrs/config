$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'
$PSNativeCommandUseErrorActionPreference = $true

"Configuring node..."

npm install azure-functions-core-tools@4 --global --unsafe=true --loglevel verbose
"+ azure-functions-core-tools@4 added to global packages"

"Configuring node ✔️"
