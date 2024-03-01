#!/bin/sh

# Get the currently logged-in user
current_user=$(stat -f "%Su" /dev/console)

# Apply the desired command using the current user's username
chmod -R og-rw "/Users/$current_user"
