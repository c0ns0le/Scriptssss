# Get the ID and security principal of the current user account
$myWindowsID = [System.Security.Principal.WindowsIdentity]::GetCurrent();
$myWindowsPrincipal = New-Object System.Security.Principal.WindowsPrincipal($myWindowsID);

# Get the security principal for the administrator role
$adminRole = [System.Security.Principal.WindowsBuiltInRole]::Administrator;

# Check to see if we are currently running as an administrator
if($myWindowsPrincipal.IsInRole($adminRole))
{
    # We are running as an administrator, so change the title and background colour to indicate this
    $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)";
    $Host.UI.RawUI.BackgroundColor = "DarkBlue";
    Clear-Host;
}else{
    # We are not running as an administrator, so relaunch as administrator

    # Create a new process object that starts PowerShell
    $newProcess = New-Object System.Diagnostics.ProcessStartInfo "PowerShell";

    # Specify the current script path and name as a parameter with added scope and support for scripts with spaces in it's path
    $newProcess.Arguments = "& '" + $script:MyInvocation.MyCommand.Path + "'"

    # Indicate that the process should be elevated
    $newProcess.Verb = "runas";

    # Start the new process
    [System.Diagnostics.Process]::Start($newProcess);

    # Exit from the current, unelevated, process
    Exit;
}

# Run your code that needs to be elevated here...

set-itemproperty -Path HKCU:\SOFTWARE\Clients\Mail -name "(Default)" -Value "Microsoft Outlook"
set-itemproperty -Path HKLM:\SOFTWARE\Clients\Mail -name "(Default)" -Value "Microsoft Outlook" 
Set-ItemProperty -Path HKLM:\SOFTWARE\Classes\mailto\Shell\open\command -name "(Default)" -Value '"C:\PROGRA~1\MICROS~1\Office15\OUTLOOK.EXE" -c IPM.Note /m "%1"'
Set-ItemProperty -Path HKCR:\\mailto\Shell\open\command -name "(Default)" -Value '"C:\PROGRA~1\MICROS~1\Office15\OUTLOOK.EXE" -c IPM.Note /m "%1"'
