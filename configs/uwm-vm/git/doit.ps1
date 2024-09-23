$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'
$PSNativeCommandUseErrorActionPreference = $true

$Proxy = ([System.Net.WebRequest]::GetSystemWebProxy().GetProxy('https://git-scm.com')).OriginalString

if($Proxy.Length -gt 0){
    git config --global http.proxy $Proxy
} else {
    git config --global --unset http.proxy  
}

$Username = $Env:BS_USER_NAME ?? (Read-Host -Prompt "Enter your user name for git logs (set `$Env:BS_USER_NAME to avoid this prompt in future)")
Write-Information "Setting git user.name to $Username"
git config --global user.name $Username 

$Email = $Env:BS_USER_EMAIL ?? (Read-Host -Prompt "Enter your email name for git logs (set `$Env:BS_USER_EMAIL to avoid this prompt in future)")
Write-Information "Setting git user.email to $Email"
git config --global user.email $Email
