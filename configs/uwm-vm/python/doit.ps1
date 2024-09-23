$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'

$Proxy = ([System.Net.WebRequest]::GetSystemWebProxy('https://pypi.org')).OriginalString

pip install ipykernel --proxy $Proxy
pip install pandas --proxy $Proxy
