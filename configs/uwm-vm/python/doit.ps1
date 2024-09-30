$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'

$Modules = @(
    'ipykernel'
    'pandas'
    'openpyxl'
)
    
$Proxy = ([System.Net.WebRequest]::GetSystemWebProxy().GetProxy('https://pypi.org')).OriginalString

$Modules | ForEach-Object {
    if($null -eq $Proxy) {
        pip install $_ 
    } else {
        pip install $_  --proxy $($Proxy)
    }
}
