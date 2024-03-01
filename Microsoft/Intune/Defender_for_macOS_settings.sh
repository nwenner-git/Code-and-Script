#!/bin/bash

#Detect and block potentially unwanted applications with Microsoft Defender for Endpoint
sudo mdatp threat policy set --type potentially_unwanted_application --action block


#Protect macOS security settings with tamper protection
#sudo mdatp config tamper-protection enforcement-level --value block


