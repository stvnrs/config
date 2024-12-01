$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'

$Modules = @(
    'black'
    'great_expectations'
    'harlequin'
    'ipykernel'
    'openpyxl'
    'pandas'
    'simple-salesforce'
)

$Proxy = ([System.Net.WebRequest]::GetSystemWebProxy().GetProxy('https://pypi.org'))

if ($null -ne $Proxy) {
    $Env:PIP_PROXY = $Proxy.OriginalString
    [Environment]::SetEnvironmentVariable("PIP_PROXY", $Env:PIP_PROXY, [System.EnvironmentVariableTarget]::User)
}

python -m pip install --upgrade pip

$Modules | ForEach-Object {
    if ($null -eq $Proxy) {
        pip install $_ 
    }
    else {
        pip install $_ 
    }
}
