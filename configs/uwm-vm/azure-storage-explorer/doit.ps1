$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'

$Stuff = @{
    Settings = @{
        Source = "$PSScriptRoot/settings.json"
        Target = "$Env:APPDATA/StorageExplorer/settings.json"
    }
}

Write-Information "This should be run after StroageExplorer has been run once"

$Stuff.GetEnumerator() | ForEach-Object {
    $Message = "Copying $($_.Value.Source) to $($_.Value.Target)" 

    try {
        Write-Information "$Message..."
        
        Copy-Item -Path $($_.Value.Source) -Destination $($_.Value.Target)
    
        Write-Information "$Message✔️"        
    }
    catch {
        Write-Information "$Message❌"        
    }    
}