#!/bin/bash

user=$(scutil <<< "show State:/Users/ConsoleUser" | awk '/Name :/ && ! /loginwindow/ { print $3 }')
echo "Current user is: $user"
chown -R $user /Users/$user
sudo chmod -R og-rw /Users/$user
