
$Stuff = @{
    Settings = @{
        Source = "$PSScriptRoot/settings.json"
        Target = "$Env:LOCALAPPDATA/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"
    }
}

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