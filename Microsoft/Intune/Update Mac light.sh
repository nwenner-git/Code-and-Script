#!/bin/bash


# ----------------------------------------------------------------------------------------------------#

# Check if Microsoft Edge is installed
if ! [ -d "/Applications/Microsoft Edge.app" ]; then
  echo "Microsoft Edge is not installed on your Mac."
  exit 1
fi

# Check for updates
echo "Checking for updates..."
softwareupdate -l | grep "Microsoft Edge"

# Update Microsoft Edge
echo "Updating Microsoft Edge..."
softwareupdate -i "Microsoft Edge"

# Verify the update
echo "Verifying the update..."
installed_version=$(mdls -name kMDItemVersion "/Applications/Microsoft Edge.app" | awk -F '"' '{print $2}')
echo "Installed version: $installed_version"


# ----------------------------------------------------------------------------------------------------#

# Check if Google Chrome is installed
if ! [ -d "/Applications/Google Chrome.app" ]; then
    echo "Google Chrome is not installed on your system."
    exit 1
fi

# Check for updates
echo "Checking for updates..."
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --version
if [ $? -ne 0 ]; then
    echo "Failed to check for updates."
    exit 1
fi

# Download and install updates
echo "Downloading and installing updates..."
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --auto-update
if [ $? -ne 0 ]; then
    echo "Failed to download and install updates."
    exit 1
fi

echo "Google Chrome has been updated successfully."

# ----------------------------------------------------------------------------------------------------#

# Check if Firefox is installed
if ! [ -d "/Applications/Firefox.app" ]; then
    echo "Firefox is not installed on your system."
    exit 1
fi

# Check for updates
echo "Checking for updates..."
"/Applications/Firefox.app/Contents/MacOS/firefox" --version
if [ $? -ne 0 ]; then
    echo "Failed to check for updates."
    exit 1
fi

# Download and install updates
echo "Downloading and installing updates..."
"/Applications/Firefox.app/Contents/MacOS/firefox" --no-remote --new-instance --channel=release --update
if [ $? -ne 0 ]; then
    echo "Failed to download and install updates."
    exit 1
fi

echo "Firefox has been updated successfully."

# ----------------------------------------------------------------------------------------------------#

# Check if Zoom Meetings is installed
if ! [ -d "/Applications/zoom.us.app" ]; then
    echo "Zoom Meetings is not installed on your system."
    exit 1
fi

# Check for updates
echo "Checking for updates..."
"/Applications/zoom.us.app/Contents/MacOS/zoom.us" --version
if [ $? -ne 0 ]; then
    echo "Failed to check for updates."
    exit 1
fi

# Download and install updates
echo "Downloading and installing updates..."
"/Applications/zoom.us.app/Contents/MacOS/zoom.us" --update
if [ $? -ne 0 ]; then
    echo "Failed to download and install updates."
    exit 1
fi

echo "Zoom Meetings has been updated successfully."

exit 0
