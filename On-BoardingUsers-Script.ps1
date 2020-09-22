#NewUserAD POWERSHELL
	#Author:Lenny K
	#9/15/20
	
	#Description:
		#Imports CSV template, takes data from it, and creates a new User Account in AD with name, logon script,
		#default group membership, title, email address, UPN and SAM.
	#See https://excel.officetuts.net/en/examples/convert-excel-file-xlsx-to-csv-in-powershell for an explanation of the xlsx to csv conversion
		

Function ExcelToCsv ($File) {
    $myDir = "C:\\\\\file.ext"
    $excelFile = "$myDir\" + $File + ".xlsx"
    $Excel = New-Object -ComObject Excel.Application
    $wb = $Excel.Workbooks.Open($excelFile)
	
    foreach ($ws in $wb.Worksheets) {
        $ws.SaveAs("$myDir\" + $File + ".csv", 6)
    }
    $Excel.Quit()
}

$FileName = "NName of new CSV file"
ExcelToCsv -File $FileName

$ImportedUsers = Import-Csv -Path 'C:\text.csv'
$Cred=Get-Credential 

$NewUserGroup= $ImportedUsers | ForEach-Object {  New-ADUser `
		-Credential $Cred `
		-Name $($_.firstname + " " + $_.lastname) `
        -GivenName $_.firstname `
        -Surname $_.lastname `
        -Department $_.Department `
		-Company $_.Company `
        -DisplayName $($_.firstname + " " + $_.lastname) `
        -UserPrincipalName $_.UserPrincipalName `
        -SamAccountName $_.SamAccountName `
		-AccountPassword $(ConvertTo-SecureString $_.Password -AsPlainText -Force) `
        -Enabled $True `
		-ChangePasswordAtLogon $True `
		-EmailAddress $_.EmailAddress `
		-Title $_.Title `
		-ScriptPath 'logon.bat' `
		-Path 'OU=,OU=,OU=,DC=,DC=' ` 
		
	Set-ADUser -Credential $Cred -Identity $_.SamAccountName -Replace @{msnpallowdialin=$True}}
	
$UserGroupAddon=Import-Csv -Path 'C:\NewUserCSV.csv'| Select-Object -Property SamAccountName
Add-ADGroupMember -Identity 'GroupName' -Members $UserGroupAddon -Credential $Cred
Add-ADGroupMember -Identity 'GroupName' -Members $UserGroupAddon -Credential $Cred
Add-ADGroupMember -Identity 'GroupName' -Members $UserGroupAddon -Credential $Cred

Clear-Host

Write-Host -Object 'User has been created with default Mill Steel groups, and Network Access' -ForeGroundColor Yellow -BackGroundColor Black
Write-Host -Object 'Window will close in 5 seconds!' -ForeGroundColor Yellow -BackGroundColor Black
Start-Sleep -Seconds 5
exit
