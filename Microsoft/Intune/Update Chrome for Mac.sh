#!/bin/bash

# Check if Google Chrome is installed
if ! [ -d "/Applications/Google Chrome.app" ]; then
  echo "Google Chrome is not installed on your Mac."
  exit 1
fi

# Check if Chrome browser is running
if pgrep "Google Chrome" >/dev/null; then
  echo "Please close Google Chrome before updating."
  exit 1
fi

# Check for updates silently
update_check=$(softwareupdate -l | grep -i "Google Chrome" 2>/dev/null)

if [ -n "$update_check" ]; then
  echo "Updating Google Chrome..."
  softwareupdate -i "$update_check" --no-print-architecture --no-print-name --no-print-globals --no-scan --no-restart --verbose 2>/dev/null
  echo "Google Chrome has been updated."
else
  echo "No updates available for Google Chrome."
fi
