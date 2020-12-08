# New User Onboarding
# For each different business, you must change the following lines: Ln128 - Company Name, Ln230 - Email domain name, Ln131 - Default Password, Ln132 - OU Path (where user ou is put)
#Ln133 - Basic Default groups they need to be in, Ln 134 - IP Phone attribute (You may need to remove if not in use or modify if you use ###-###-#### instead of ####(last four of number))

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$NewUserOnBoarding             = New-Object system.Windows.Forms.Form
$NewUserOnBoarding.ClientSize  = New-Object System.Drawing.Point(751,342)
$NewUserOnBoarding.text        = "New User On-Boarding GUI"
$NewUserOnBoarding.TopMost     = $false
$NewUserOnBoarding.BackColor   = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $false
$TextBox1.text                   = 
$TextBox1.width                  = 300
$TextBox1.height                 = 20
$TextBox1.location               = New-Object System.Drawing.Point(185,59)
$TextBox1.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$TextBox1.BackColor              = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "A GUI Tool to create AD Accounts. Just input basic data, and this will create basic accounts. "
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 118
$Label1.location                 = New-Object System.Drawing.Point(20,13)
$Label1.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',12,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Label1.BackColor                = [System.Drawing.ColorTranslator]::FromHtml("#97c5fc")

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "New Users First Name:"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(40,65)
$Label2.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Label2.BackColor                = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$Label3                          = New-Object system.Windows.Forms.Label
$Label3.text                     = "New Users Last Name:"
$Label3.AutoSize                 = $true
$Label3.width                    = 25
$Label3.height                   = 10
$Label3.location                 = New-Object System.Drawing.Point(39,95)
$Label3.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Label3.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("#000000")
$Label3.BackColor                = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$TextBox2                        = New-Object system.Windows.Forms.TextBox
$TextBox2.multiline              = $false
$TextBox2.text                   = 
$TextBox2.width                  = 300
$TextBox2.height                 = 20
$TextBox2.location               = New-Object System.Drawing.Point(185,90)
$TextBox2.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label4                          = New-Object system.Windows.Forms.Label
$Label4.text                     = "Job Title:"
$Label4.AutoSize                 = $true
$Label4.width                    = 25
$Label4.height                   = 10
$Label4.location                 = New-Object System.Drawing.Point(122,125)
$Label4.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Label4.BackColor                = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$TextBox3                        = New-Object system.Windows.Forms.TextBox
$TextBox3.multiline              = $false
$TextBox3.text                   = 
$TextBox3.width                  = 300
$TextBox3.height                 = 20
$TextBox3.location               = New-Object System.Drawing.Point(185,120)
$TextBox3.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label5                          = New-Object system.Windows.Forms.Label
$Label5.text                     = "Department:"
$Label5.AutoSize                 = $true
$Label5.width                    = 25
$Label5.height                   = 10
$Label5.location                 = New-Object System.Drawing.Point(103,155)
$Label5.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Label5.BackColor                = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$TextBox4                        = New-Object system.Windows.Forms.TextBox
$TextBox4.multiline              = $false
$TextBox4.text                   = 
$TextBox4.width                  = 300
$TextBox4.height                 = 20
$TextBox4.location               = New-Object System.Drawing.Point(185,150)
$TextBox4.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label6                          = New-Object system.Windows.Forms.Label
$Label6.text                     = "Office Location:"
$Label6.AutoSize                 = $true
$Label6.width                    = 25
$Label6.height                   = 10
$Label6.location                 = New-Object System.Drawing.Point(84,185)
$Label6.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Label6.BackColor                = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$TextBox5                        = New-Object system.Windows.Forms.TextBox
$TextBox5.multiline              = $false
$TextBox5.text                   = 
$TextBox5.width                  = 300
$TextBox5.height                 = 20
$TextBox5.location               = New-Object System.Drawing.Point(185,180)
$TextBox5.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Ok, I Checked, Lets go!"
$Button1.width                   = 203
$Button1.height                  = 30
$Button1.location                = New-Object System.Drawing.Point(450,273)
$Button1.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Button1.Add_Click({AddADUser})
    function AddADUser { 
    $FirstName = $TextBox1.text #First Name input
    $LastName = $TextBox2.text  #Last Name input
    $JobTitle = $TextBox3.text  #Job Title Input
    $Department = $TextBox4.text   #Department Input
    $OfficeLocation = $TextBox5.text   #Office Location Input

    $A = $TextBox6.text          #Takes user input as a string
    $B = $A.Substring(8)
    
    $Credential = Get-Credential
    $FullName = $FirstName + " " + $LastName
    $Company = "Contoso"
    $SamAccountName = $FirstName.Substring(0,1) + $LastName
    $EmailAddress = $FirstName.Substring(0,1) + $LastName + "@Contoso.com"
    $PW = ConvertTo-SecureString -AsPlainText "pl3aSeChangeY0urP@sSword!" -Force
    New-ADUser -Credential $Credential -Name $FullName -GivenName $FirstName -Surname $LastName -SamAccountName $SamAccountName -Department $Department -Company $Company -Office $OfficeLocation -DisplayName $FullName -Description $JobTitle -EmailAddress $EmailAddress -UserPrincipalName $EmailAddress -Title $JobTitle -Path "OU=X,DC=X,DC=X" -AccountPassword $PW -Enabled $true -ChangePasswordAtLogon $true -HomePhone $A -OfficePhone $A 
    Add-ADGroupMember -Identity '#Get basic groups they need' -Members $SamAccountName -Credential $Credential
    Set-ADUser -Identity $SamAccountName -Add @{ipPhone = $B}
    $NewUserOnBoarding.Close()
    }

$Label7                          = New-Object system.Windows.Forms.Label
$Label7.text                     = "PLEASE DOUBLE CHECK ENTRY IS CORRECT"
$Label7.AutoSize                 = $true
$Label7.width                    = 25
$Label7.height                   = 10
$Label7.location                 = New-Object System.Drawing.Point(100,280)
$Label7.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Label7.BackColor                = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$Label8                          = New-Object system.Windows.Forms.Label
$Label8.text                     = "Phone Number:"
$Label8.AutoSize                 = $true
$Label8.width                    = 25
$Label8.height                   = 10
$Label8.location                 = New-Object System.Drawing.Point(83,215)
$Label8.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$TextBox6                        = New-Object system.Windows.Forms.TextBox
$TextBox6.multiline              = $false
$TextBox6.text                   = ""
$TextBox6.width                  = 300
$TextBox6.height                 = 20
$TextBox6.location               = New-Object System.Drawing.Point(185,210)
$TextBox6.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$NewUserOnBoarding.controls.AddRange(@($TextBox1,$Label1,$Label2,$Label3,$TextBox2,$Label4,$TextBox3,$Label5,$TextBox4,$Label6,$TextBox5,$Button1,$Label7,$Label8,$TextBox6))

[void]$NewUserOnBoarding.ShowDialog()
