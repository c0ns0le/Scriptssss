# MyScript.ps1
$FMNO = read-host "Enter your name"

Get-ADComputer -Filter 'SamAccountName' -Like "*$FMNO*"' | select name 