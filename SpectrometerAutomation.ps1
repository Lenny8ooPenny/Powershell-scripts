#Spectrometer Backup

#Remove the old Backup and rename the new "Temp" folder as the date it was created in. 

#This rename the new Item to match the creation date.
Get-ChildItem -Path '\\msfs1\millsteel\Teams\Support\Backups\Spectrometer\Test' | 
Sort-Object -Property LastWriteTime | Select-Object -Last 1 | Rename-Item -NewName {$_.CreationTime.toString("yyyy-MM-dd")} 

#This deletes the last created Item. 
Get-ChildItem -Path '\\msfs1\millsteel\Teams\Support\Backups\Spectrometer\Test' | 
Sort-Object -Property LastWriteTime | Select-Object -First 1 | Remove-Item -Recurse 

Write-Host -Object 'PowerShell Window will close in 10 seconds!'

Start-Sleep -Seconds 10

Exit
