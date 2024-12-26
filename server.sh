#!/bin/bash


RED="\e[1;31m"
GREEN="\e[1;32m"
EXIT="\e[1;0m"
BLUE="\e[34m"
divide () {
	echo -e "${RED}+++++++++++++++++++++++++++++++++++++++++++${EXIT}"
}

clear

echo -e "*******************${GREEN}Server Info${EXIT}**************"

echo -e "${BLUE}Today's date ${EXIT} `date`"
divide
echo "${BLUE}Uptime:${EXIT} `uptime`"
divide
echo "${BLUE}Users logged-on now${EXIT}"
w
divide
echo -e "${BLUE}Last logins${EXIT} \n`last -a | head -n 3`"
divide
echo -e "${BLUE}Disk and Memory usage${EXIT} \n$(df -h | awk '/^\/dev/ {print "Free total disk:" $4 "/" $2}')"
free -m | awk '/^Mem:/ {print "Free/Total Memory: " $4 "/" $2 " MB"}'
divide
echo -e "${BLUE}The Most expensive processes${EXIT} \n`top -b | head -n 10 | tail -n 4`"
divide
