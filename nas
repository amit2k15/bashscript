$driveLetter = $args[0]
$drive = Get-WmiObject -Class Win32_LogicalDisk | Where-Object { $_.DeviceID -eq $driveLetter }
$usedSpace = $drive.Size - $drive.FreeSpace
$utilization = ($usedSpace / $drive.Size) * 100
Write-Host $utilization

UserParameter=custom.nas.drive[*],powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\path\to\zabbix_script.ps1" "$1"
