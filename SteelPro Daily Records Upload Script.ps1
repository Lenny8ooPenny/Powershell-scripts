#SteelPro Daily Records 

    #Gets most recent file, and renames it to the written date minues one day, saved as a CSV file type.
        Get-ChildItem -Path ('\\networkshare\xxxx') | Sort-Object -Property LastWriteTime | Select-Object -Last 1 | Rename-Item -NewName {$_.CreationTime.AddDays(-1).ToString("yyyy-MM-dd 'Name of file.csv'") } 

    #This copies the updated file to your other directory
        Get-ChildItem -Path ('\\same network share as above\') | Sort-Object -Property LastWriteTime | Select-Object -Last 1 | Copy-Item -Destination "\\other network share\ZZZZ"
    
Start-Sleep -s 3

Exit 
