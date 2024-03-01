#!/bin/bash


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

exit 0
