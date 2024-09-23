$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'

$Proxy = ([System.Net.WebRequest]::GetSystemWebProxy().GetProxy('https://pypi.org')).OriginalString

pip install ipykernel --proxy $Proxy
pip install pandas --proxy $Proxy
