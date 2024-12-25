#!/bin/bash

# Script for monitoring disk free space
# Checking the status of the user

if [ $UID -eq 0 ]; then  
    # If the user is authorized as root, send info via email
    THRESHOLD=80
    EMAIL="dosanov.1997@bk.ru"

    USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//')

    if [ "$USAGE" -gt "$THRESHOLD" ]; then
        echo "Disk space usage is at ${USAGE}%. Please check the server." | mail -s "Disk Space Alert" "$EMAIL"
    fi
    echo "Current disk usage: $USAGE%"    
else
    echo "This file system can't be accessed by user: $USER"
fi

