$ServiceName = 'Service Name'
$arrService = Get-Service -Name $ServiceName
$ServiceNameExe = 'C:\filepath\"application.exe"'
while ($arrService.Status -ne 'Running')
{

    Start-Process $ServiceNameExe
    write-host $arrProcess.status
    write-host 'FTPd Service starting'
    Start-Sleep -seconds 20
    $arrService.Refresh()
    if ($arrService.Status -eq 'Running')
    {
        Write-Host 'Service is now Running'
    }

}
Start-Sleep -S 5
Exit
