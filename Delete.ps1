$Drives = Get-PSDrive F;
foreach($Drive in $drives) {
 
    Get-ChildItem -Path $Drive.Root -Recurse -File -ErrorAction SilentlyContinue -Force -Filter "*.png"|
        ForEach-Object {
            $Hash = Get-FileHash $_.FullName -Algorithm MD5 | Select-Object Hash
            $legit = Get-FileHash "E:\011.png" -Algorithm MD5 | Select-Object Hash
     
            if($Hash -match  $legit) {
                
                echo "Deleting: " $_.FullName
               
                #$_.MoveToRecycleBin()
                $_.Delete()
            }

        }

 }
