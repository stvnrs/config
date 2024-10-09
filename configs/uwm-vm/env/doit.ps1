$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'
$PSNativeCommandUseErrorActionPreference = $true

"Setting env..."

if ($env:PROXY) {
    "+ `$env:PROXY already set to $env:PROXY"
} else {
    $Proxy = ([System.Net.WebRequest]::GetSystemWebProxy().GetProxy('https://www.powershellgallery.com/'))

    if ($null -ne $Proxy) {
        $env:PROXY = $Proxy.OriginalString
        [Environment]::SetEnvironmentVariable("PROXY", $env:PROXY, [System.EnvironmentVariableTarget]::User)
        "+ `$env:PROXY to $env:PROXY"
    }    else {
        "+ no proxy detected"
    }
}

"Setting env✔️"