#SteelPro Daily Records 

    #Gets most recent file, and renames it to the written date minues one day, saved as a CSV file type.
        Get-ChildItem -Path ('\\msas400.millsteel.local\SSP\Sales\SalesDetail\') | Sort-Object -Property LastWriteTime | Select-Object -Last 1 | Rename-Item -NewName {$_.CreationTime.AddDays(-1).ToString("yyyy-MM-dd 'Sales Detail Test.csv'") } 

    #This copies the updated file to the L Drive
        Get-ChildItem -Path ('\\msas400.millsteel.local\SSP\Sales\SalesDetail\') | Sort-Object -Property LastWriteTime | Select-Object -Last 1 | Copy-Item -Destination "\\msfs1\millsteel\Teams\Accounting\SteelPro\"
    
Start-Sleep -s 3

Exit 