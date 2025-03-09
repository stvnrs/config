$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'
$PSNativeCommandUseErrorActionPreference = $true

$FilePath =  '~/.duckdbrc'
$MessagePrefix = 'duckdb config'
$em = '*'

function do-it{
    $Proxy = ([System.Net.WebRequest]::GetSystemWebProxy().GetProxy('https://git-scm.com')).OriginalString
    $Settings = @(
        '.changes on'
        ".prompt 'SQL> ' '>>   '"
        '.timer on'
        )
        
        $Settings | % {
            "+ $($MessagePrefix):setting $em$_$em" 
        }
        
        if($Proxy.Length -gt 0){
            $Settings += "SET http_proxy = '$Proxy'"
            "+ including proxy setting $em$Proxy$em"
        }
        
        $Settings > $FilePath
}

"$($MessagePrefix): creating $FilePath..."
do-it
"$($MessagePrefix): creating $FilePath...✔️"