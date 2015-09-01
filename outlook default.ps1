set-itemproperty -Path HKCU:\SOFTWARE\Clients\Mail -name "(Default)" -Value "Microsoft Outlook"
set-itemproperty -Path HKLM:\SOFTWARE\Clients\Mail -name "(Default)" -Value "Microsoft Outlook" 
Set-ItemProperty -Path HKLM:\SOFTWARE\Classes\mailto\Shell\open\command -name "(Default)" -Value '"C:\PROGRA~1\MICROS~1\Office15\OUTLOOK.EXE" -c IPM.Note /m "%1"'
Set-ItemProperty -Path HKCR:\\mailto\Shell\open\command -name "(Default)" -Value '"C:\PROGRA~1\MICROS~1\Office15\OUTLOOK.EXE" -c IPM.Note /m "%1"'
