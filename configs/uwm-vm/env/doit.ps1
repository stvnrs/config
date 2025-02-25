$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'
$PSNativeCommandUseErrorActionPreference = $true

"Setting env..."

if ($env:PROXY) {
    "+ `$env:PROXY already set to $env:PROXY"
} else {
    . "$PSScriptRoot\..\..\tools\proxy.ps1"
    $TestUri = 'https://www.powershellgallery.com/'
    $Proxy = Get-Proxy -TestUri $TestUri

    if ($null -ne $Proxy) {
        $env:PROXY = $Proxy.OriginalString
        [Environment]::SetEnvironmentVariable("PROXY", $env:PROXY, [System.EnvironmentVariableTarget]::User)
        "+ `$env:PROXY to $env:PROXY"
    }    else {
        "+ no proxy detected"
    }
}

"Setting env - done!"