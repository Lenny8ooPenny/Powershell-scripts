#Removes the oldest file in the directory and changes the newest file name to match its creation date. 

#This rename's the new item to match the creation date.
Get-ChildItem -Path '\\path of directory you want to change | 
Sort-Object -Property LastWriteTime | Select-Object -Last 1 | Rename-Item -NewName {$_.CreationTime.toString("yyyy-MM-dd")} 

#This deletes the last created Item. 
Get-ChildItem -Path '\\path of directory you want to change' | 
Sort-Object -Property LastWriteTime | Select-Object -First 1 | Remove-Item -Recurse 

Write-Host -Object 'PowerShell Window will close in 10 seconds!'

Start-Sleep -Seconds 10

Exit
