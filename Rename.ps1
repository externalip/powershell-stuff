

$Drives = Get-PSDrive F;
$extensions



foreach($Drive in $drives) {
    #png and jpg

    Get-ChildItem -Path $Drive.Root -Recurse -File -ErrorAction SilentlyContinue -Force -Filter "*.png"|


        ForEach-Object {
           
        
            $file = Get-ChildItem -Path $_ -File
            $line += (($file.DirectoryName).Split("\")[-1]) + "," + ($file.Name) + "`r`n"
            $line2 += (($file.DirectoryName).Split("\")[-1])
         
             echo "`r`n" + $_.Name + "has been renamed to"
        
             $name = (($file.DirectoryName).Split("\")[-1])+"_" + $file.Name
             Rename-item -path $_ -newname $name
             echo $_.Name
       
     
        
        }
          Get-ChildItem -Path $Drive.Root -Recurse -File -ErrorAction SilentlyContinue -Force -Filter "*.jpg"|


        ForEach-Object {
           
        
            $file = Get-ChildItem -Path $_ -File
            $line += (($file.DirectoryName).Split("\")[-1]) + "," + ($file.Name) + "`r`n"
            $line2 += (($file.DirectoryName).Split("\")[-1])
        
             echo "`r`n" + $line + "has been renamed to"
            
             $name = (($file.DirectoryName).Split("\")[-1])+"_" + $file.Name
             Rename-item -path $_ -newname $name
             echo $_
           

     
        
        }


 }
