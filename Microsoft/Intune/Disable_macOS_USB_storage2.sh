#!/bin/bash

# Disable removable media on macOS

# Unload the USB storage driver
sudo kextunload /System/Library/Extensions/IOUSBMassStorageClass.kext

# Disable USB storage
sudo nvram boot-args="kext-dev-mode=1"

echo "Removable media has been disabled."