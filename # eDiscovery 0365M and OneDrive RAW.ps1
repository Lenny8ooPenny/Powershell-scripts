# eDiscovery 0365M and OneDrive

    Install-Module ExchangeOnlineManagement -Confirm:$false
    Import-Module ExchangeOnlineManagement

# Connects to Security & Compliance Center PowerShell in a Microsoft 365, make sure to disconnect!
    $Credential = Get-Credential
    Connect-IPPSSession -Credential $Credential

# Variable Sets for Exchange 

    $TermUser = Read-Host "Enter First letter of first name, followed by last name"   
    $TermUserMail = $TermUser + '@contoso.com'
    $CaseName = $TermUser + 'TERM'
    $SearchMail = $TermUser + 'Exchange'

    New-ComplianceCase -Name $CaseName 
        New-ComplianceSearch -Name "$SearchMail" -Case $CaseName -ExchangeLocation $TermUserMail 
            Start-Sleep -S 5
        Start-ComplianceSearch -Identity "$SearchMail"
            Start-Sleep -S 5
        New-ComplianceSearchAction -SearchName "$SearchMail" -Export -ExchangeArchiveFormat PerUserPst -EnableDedupe $true
            Start-Sleep -S 5

#Variable Sets for OneDrive    

    $SearchOneDrive = $TermUser + 'OneDrive'
    $OneDriveURL = 'https://contoso-my.sharepoint.com/personal/' + $TermUser + '_contoso_com'
 
        New-ComplianceSearch -Name  "$SearchOneDrive" -Case $CaseName -SharePointLocation $OneDriveURL 
            Start-Sleep -S 5 
        Start-ComplianceSearch -Identity "$SearchOneDrive"
            Start-Sleep -S 10
        New-ComplianceSearchAction -SearchName "$SearchOneDrive" -Export -SharePointArchiveFormat IndividualMessage -EnableDedupe $true
            Start-Sleep -S 15

    Disconnect-ExchangeOnline -Confirm:$false    
