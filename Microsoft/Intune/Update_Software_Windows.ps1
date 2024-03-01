# Check if Zoom Meetings is installed
if (-not (Test-Path "C:\Users\$env:UserName\AppData\Roaming\Zoom\bin\Zoom.exe")) {
    Write-Host "Zoom Meetings is not installed on your system."
    exit 1
}

# Check for updates
Write-Host "Checking for updates..."
$zoomVersion = (Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\ZoomUMX").DisplayVersion
if (-not $zoomVersion) {
    Write-Host "Failed to check for updates."
    exit 1
}
Write-Host "Current Zoom version: $zoomVersion"

# Download and install updates
Write-Host "Downloading and installing updates..."
$downloadUrl = "https://zoom.us/client/latest/ZoomInstaller.exe"
$downloadPath = "$env:TEMP\ZoomInstaller.exe"

try {
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    if (-not (Test-Path $downloadPath)) {
        Write-Host "Failed to download updates."
        exit 1
    }

    # Install Zoom updates silently
    Start-Process -FilePath $downloadPath -ArgumentList "/S" -Wait
}
catch {
    Write-Host "Failed to download and install updates."
    exit 1
}

Write-Host "Zoom Meetings has been updated successfully."

exit 0
