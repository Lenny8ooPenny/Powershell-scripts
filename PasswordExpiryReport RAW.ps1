# Process Each User for Password Expiry Report

$users = Get-Aduser -properties Name, PasswordNeverExpires, PasswordExpired, PasswordLastSet, EmailAddress -filter { (Enabled -eq 'True') -and (PasswordNeverExpires -eq 'False') } | Where-Object { $_.PasswordExpired -eq $False }
$maxPasswordAge = (Get-ADDefaultDomainPasswordPolicy).MaxPasswordAge
$X = @(foreach ($user in $users)
        {   $Name = (Get-ADUser $user | ForEach-Object { $_.Name })
            $emailaddress = $user.emailaddress
            #Get the passwords last set date
            $passwordSetDate = (Get-ADUser $user -properties * | ForEach-Object { $_.PasswordLastSet })
            $expireson = $passwordSetdate + $maxPasswordAge
            $today = (get-date)
            #Gets the count on how many days until the password expires and stores it in the $daystoexpire var
            $daystoexpire = (New-TimeSpan -Start $today -End $Expireson).Days
            $expireindays = 7
                If (($daystoexpire -ge "0") -and ($daystoexpire -lt $expireindays))
                    {
                        $Report = @()
                            $NewReportObj = New-Object psobject
                            $NewReportObj | Add-Member -NotePropertyName "End User" -NotePropertyValue $Name
                            $NewReportObj | Add-Member -NotePropertyName "Expires in Days" -NotePropertyValue $daystoexpire
                            $NewReportObj | Add-Member -NotePropertyName "Email Address" -NotePropertyValue $emailaddress
                            $Report += $NewReportObj
                        $Report 
                    }
        }
        )

$X | Export-Csv C:\Users\user\Downloads\expiryReport.csv -NoTypeInformation

#Now send that csv as an attachment to IT personnel or distro group
$FromEmail = "user@contoso.com"
$Totest = "usertest@contoso.com"
$Cred = Get-Credential 
$Subject = "Expiry Report"
$Body = "Hello IT Team, here is the morning expiry report. An email has been sent to each person in this list."
$Attch = "C:\Users\user\Downloads\expiryReport.csv"

Send-MailMessage -Credential $Cred -From $FromEmail -UseSsl -To $Totest -Subject $Subject -Body $Body -Attachments $Attch -SmtpServer smtp.office365.com

#Now Send users within that expiration scope the email notification plus amount of days left to change
$Clost2Expire = Import-Csv C:\Users\user\Downloads\expiryReport.csv | Select-Object -Property "End User","Email Address","Expires in Days"
           
             foreach($person in $Clost2Expire)
                    {   
                        $acctuser = $person.'End User'
                        $expire = $person.'Expires in Days'
                        $acctmail = $person.'Email Address'
                        Send-MailMessage -Credential $Cred -From $FromEmail -UseSsl -To $acctmail -Subject "Password Will Expire Soon" -Body "Hello $acctuser, Your password will expire in $expire days. Please change soon, thank you. If you have anyquestions, email user@contoso.com." -SmtpServer smtp.office365.com
                    } 