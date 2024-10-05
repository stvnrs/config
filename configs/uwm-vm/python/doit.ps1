$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'

$Modules = @(
    'black'
    'ipykernel'
    'openpyxl'
    'pandas'
)
    
$Proxy = ([System.Net.WebRequest]::GetSystemWebProxy().GetProxy('https://pypi.org')).OriginalString

$Modules | ForEach-Object {
    if($null -eq $Proxy) {
        pip install $_ 
    } else {
        pip install $_  --proxy $($Proxy)
    }
}
