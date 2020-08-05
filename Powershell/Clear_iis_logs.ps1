 # Script Will Delete IIS Logs Older than 60 days

 $LogPath = "C:\inetpub\logs" 
 $maxDaystoKeep = -60 
 $outputPath = "c:\Temp\CleanupTask"
 $outputFile = "c:\Temp\CleanupTask\Cleanup_Old_logs.log" 
 
 #Test the outputPath
 if (-not (Test-Path -LiteralPath $outputPath)) {
     
     try {
         New-Item -Path $outputPath -ItemType Directory -ErrorAction Stop | Out-Null #-Force
     }
     catch {
         Write-Error -Message "Unable to create directory '$outputPath'. Error was: $_" -ErrorAction Stop
     }
     "Successfully created directory '$outputPath'."
 
 }
 else {
     "Directory already existed"
     }
   
 $itemsToDelete = dir $LogPath -Recurse -File *.log | Where LastWriteTime -lt ((get-date).AddDays($maxDaystoKeep)) 
   
 if ($itemsToDelete.Count -gt 0){ 
     ForEach ($item in $itemsToDelete){ 
         "$($item.BaseName) is older than $((get-date).AddDays($maxDaystoKeep)) and will be deleted" | Add-Content $outputFile
         $item.FullName | Remove-Item -Verbose 
     } 
 } 
 ELSE{ 
     "No items to be deleted today $($(Get-Date).DateTime)"  | Add-Content $outputFile
     } 
    
 Write-Output "Cleanup of log files older than $((get-date).AddDays($maxDaystoKeep)) completed..." 
 start-sleep -Seconds 10 
 