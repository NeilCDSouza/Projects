# Add Windows Presentation Framework

Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass

Add-Type -AssemblyName PresentationFramework

# Calculate UpTime in Days
$WMI = Get-WmiObject win32_operatingsystem
$UpTime = (Get-Date) - ($WMI.ConvertToDateTime($WMI.LastBootUpTime))
$UptimeDays = $Uptime.Days
if ($UptimeDays -gt "7") {
$Output = "$UptimeDays Days"
} else {
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Undefined
Exit 0

}
# Message Box Options 
$Title = "Windows Restart Manager"
$Body = "Your computer hasn't been rebooted in $Output. Please save all current progress and restart your machine."
$Icon = "Warning"
$Button = "OK"

# Show Message Box
[System.Windows.MessageBox]::Show("$Body","$Title","$Button","$Icon")

