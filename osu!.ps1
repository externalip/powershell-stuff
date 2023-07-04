$Loc = Read-Host "Osu Location"
$Output = Read-Host "Output Text location"
Get-ChildItem -Path $Loc -Recurse -File -ErrorAction SilentlyContinue -Force -Filter "audio.mp3" |
ForEach-Object {
    $file = Get-ChildItem -Path $_ -File
    $NewName = ((($file.DirectoryName).Split("\")[-1]) -replace '\d+', '').Trim() 
    Write-Output $NewName
    Copy-Item -Path $_ -Destination (join-path $Output $NewName".mp3")       
}