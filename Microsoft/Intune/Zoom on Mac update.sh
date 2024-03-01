#!/bin/bash

# Update Zoom
check=$(softwareupdate -l | grep Zoom | grep -o 'Zoom[^[:blank:]]*' | head -n 1)
echo "$check"
softwareupdate -i -r "$check"
status=$?
if [ $status -eq 0 ]; then
  echo "Zoom update was successful."
elif [ $status -eq 1 ]; then
  echo "Zoom update failed."
elif [ $status -eq 2 ]; then
  echo "No Zoom update available."
else
  echo "Unknown error."
fi
exit