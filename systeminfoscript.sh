#!/bin/bash

echo "========= System Information ========="
echo

#Get my internal IP address
echo -e "Internal IP Address:" 
ifconfig | grep broadcast | awk '{print $2}'
echo

#Get my external IP address
echo "External IP Address:"
curl -s ifconfig.io
echo

#Get my MAC address, masking the last 3 blocks
echo "MAC Address:"
ip a | grep link/ether | awk '{print $2}'| awk -F: '{print $1":"$2":"$3 ":" "XX" ":" "XX" ":" "XX" }'
echo 

#Show CPU usage for top 5 processes
echo "Top 5 CPU Usage:"
ps aux | sort -r -k 3 | head -n 6
echo

#Show total and available memory
echo "Memory Statistics:"
free -h
echo

#List all installed services and their status
echo "Active services:"
service --status-all | grep '\[ + \]'
echo "Inactive services:"
service --status-all | grep '\[ - \]'
echo

#Locate top 10 largest files in /home
echo "10 Largest Files in Home Directory:"
find /home -type f -exec du -h {} + 2>/dev/null | sort -hr | head -n 10
echo

echo "========= End Of Report ========="
