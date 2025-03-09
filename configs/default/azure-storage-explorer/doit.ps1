$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'

$Stuff = @{
    Settings = @{
        Source = "$PSScriptRoot/settings.json"
        Target = "$Env:APPDATA/StorageExplorer/settings.json"
    }
}

$Stuff.GetEnumerator() | ForEach-Object {
    $Message = "Copying $($_.Value.Source) to $($_.Value.Target)" 

    try {
        Write-Information "$Message..."

        $TargetPath = Split-Path $_.Value.Target -Parent

        if(!(Test-Path $TargetPath)){
            mkdir $TargetPath
        }
        
        Copy-Item -Path $($_.Value.Source) -Destination $($_.Value.Target)
    
        Write-Information "$Message✔️"        
    }
    catch {
        Write-Information "$Message❌"        
    }    
}