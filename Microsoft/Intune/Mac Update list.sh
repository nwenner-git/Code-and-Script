#!/bin/bash

# Update Zoom
 check=$(softwareupdate -l | grep Zoom | grep -o 'Zoom[^[:blank:]]*' | head -n 1)
  echo "$check"
 softwareupdate -i "$check"
exit