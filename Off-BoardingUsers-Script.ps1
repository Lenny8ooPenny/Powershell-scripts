	#Off-Boarding Script
	#Author:Lenny K
	#9/14/20
	#Special thanks to the Internet folks and Ty
	
#Description
	#Scripts asks for the SaM account name: xxxxx01
	#Removes all security and distribution groups, disables the account, moves it to the Disabled Users OU, generates a 16 bit complex password
	#Secures the password using 'ConvertTo-SecureString' and applies it. Script then automatically closes 10 seconds later.

$Creds=Get-Credential ""
$User = Read-Host -Prompt 'Enter the 01 username of the employee to clean up'
Get-ADPrincipalGroupMembership -Identity $User | select name -Skip 1 | foreach {Remove-ADGroupMember -Identity $_.name -Members $User -Confirm:$false -Credential $Creds}
Disable-ADAccount -Identity $User -Credential $Creds
Get-ADUser -Identity $User | Move-ADObject -TargetPath "OU=,DC=,DC=" -Credential $Creds

Function New-RandomPassword { 
    [CmdletBinding()]
    param(
        [ValidateRange(4,79)]
        [int]    $Length = 16,
        [switch] $ExcludeSpecialCharacters
    )
 
 
    BEGIN {
        $SpecialCharacters = @((33,35) + (36..38) + (42..44) + (60..64) + (91..94))
    }
 
    PROCESS {
        try {
            if (-not $ExcludeSpecialCharacters) {
                    $Password = -join ((48..57) + (65..90) + (97..122) + $SpecialCharacters | Get-Random -Count $Length | foreach {[char]$_})
                } else {
                    $Password = -join ((48..57) + (65..90) + (97..122) | Get-Random -Count $Length | foreach {[char]$_})  
            }
 
        } catch {
            throw $_.Exception.Message
        }
 
    }
 
    END {
        Write-Output "$Password"
    }
 }
 
$NewPwd= ConvertTo-SecureString -String "New-RandomPassword" -AsPlainText -Force  
Set-ADAccountPassword -Identity $User -Newpassword $NewPwd -Reset -Credential $Creds

clear-host

Write-Host -Object 'Password has been randomly generated, and changed!' -ForegroundColor Yellow -BackgroundColor Black
Write-Host -Object 'User has been disabled and moved to the Disabled Users OU!' -ForegroundColor Yellow -BackgroundColor Black
Write-Host -object 'All security and distribution groups have been removed!' -ForegroundColor Yellow -BackgroundColor Black
Write-Host -Object 'Task is complete, Session will close in 10 seconds!' -ForegroundColor Yellow -BackgroundColor Black

start-sleep -seconds 10

exit
