$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'
$PSNativeCommandUseErrorActionPreference = $true

"Setting env..."

if ($env:HTTP_PROXY) {
    "+ `$env:HTTP_PROXY already set to $env:HTTP_PROXY"
} else {
    $Proxy = ([System.Net.WebRequest]::GetSystemWebProxy().GetProxy('https://www.powershellgallery.com/'))

    if ($null -ne $Proxy) {
        $env:HTTP_PROXY = $Proxy.OriginalString
        [Environment]::SetEnvironmentVariable("HTTP_PROXY", $env:HTTP_PROXY, [System.EnvironmentVariableTarget]::User)
        "+ `$env:HTTP_PROXY to $env:HTTP_PROXY"
    }    else {
        "+ no proxy detected"
    }
}

"Setting env✔️"