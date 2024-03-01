#!/bin/bash

#https://helpx.adobe.com/enterprise/package/help/apps-deployed-without-their-base-versions.html

if [[ -f /usr/local/bin/RemoteUpdateManager ]]; then
  echo "Starting Adobe RemoteUpdateManger..."
  /usr/local/bin/RemoteUpdateManager --action=install
else
  echo "Adobe RemoteUpdateManager not found."
fi