$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'

$Extensions = @(
    'ms-toolsai.jupyter'
    'ms-python.python' 
    'mechatroner.rainbow-csv'
)

$Extensions | ForEach-Object {
    code-insiders --install-extension $_
}