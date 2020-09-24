#Moves files from one computer to a shared network drive, remotely. Has the function for you enter specific dates automatically or if you want to enter the data your self just add the Read-Host -Object 'enter date' variable. 

$Begin = 'Date as mm/dd/yyyy'
$End = 'Date as mm/dd/yyyy'

$DateB = [datetime] $Begin
$DateE = [datetime] $End

$Cred= Get-Credential ""

Invoke-Command -Credential $Cred -ComputerName 'Computer name' -ScriptBlock { Get-ChildItem -Path 'Path of file' |
Where-Object {$_.CreationTime -ge $using:DateB -and $_.CreationTime -le $using:DateE }} | Copy-Item -Destination '\\network\share'
