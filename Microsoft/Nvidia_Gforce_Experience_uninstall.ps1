# Check if Nvidia GeForce Experience is installed
$geforceExperiencePath = "C:\Program Files\NVIDIA Corporation\NVIDIA GeForce Experience\NVIDIA GeForce Experience.exe"
if (!(Test-Path $geforceExperiencePath)) {
    Write-Host "Nvidia GeForce Experience is not installed on this computer."
    Exit
}

# Check for updates
$installDir = Split-Path $geforceExperiencePath -Parent
$updateExePath = Join-Path $installDir "NVIDIA GeForce Experience Updater.exe"

if (!(Test-Path $updateExePath)) {
    Write-Host "Unable to locate the Nvidia GeForce Experience updater."
    Exit
}

Write-Host "Checking for updates..."
Start-Process -FilePath $updateExePath -ArgumentList "--checkupdate" -Wait

# Install updates
$installUpdates = Read-Host "Updates are available. Do you want to install them? (Y/N)"
if ($installUpdates -eq "Y" -or $installUpdates -eq "y") {
    Write-Host "Installing updates..."
    Start-Process -FilePath $updateExePath -ArgumentList "--installupdate" -Wait
    Write-Host "Updates installed successfully."
} else {
    Write-Host "Updates installation canceled."
}
