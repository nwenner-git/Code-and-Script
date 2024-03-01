#!/bin/bash
curl -O https://nmap.org/dist/nmap-7.94.dmg
hdiutil mount nmap-7.94.dmg
sudo installer -pkg /Volumes/nmap-7.94/nmap-7.94.pkg -target /
echo "Hostname:" > ~/Desktop/nmap_scan.txt
hostname >> ~/Desktop/nmap_scan.txt
echo "IP Address:" >> ~/Desktop/nmap_scan.txt
ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}' >> ~/Desktop/nmap_scan.txt
echo "Nmap Scan:"
nmap -p 1-65000 localhost >> ~/Desktop/nmap_scan.txt
netstat -vanp tcp >> ~/Desktop/nmap_scan.txt

# Get the PID values from netstat
pid_list=$(netstat -vanp tcp | awk '{print $9}' | grep -oE '[0-9]+')

# Loop through the PID values and run ps against each one
for pid in $pid_list
do
    ps -p $pid >> ~/Desktop/nmap_scan.txt
done