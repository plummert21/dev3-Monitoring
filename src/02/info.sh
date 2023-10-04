#!/bin/bash

get_info() {
    TIMEZONE=$(timedatectl | grep 'Time zone')
    OS=$(cat /etc/os-release | grep 'PRETTY_NAME=' | sed 's/PRETTY_NAME="//' | sed 's/\"//')
    DATE=$(date | awk '{print $2,$3,$4,$5}')
    UPTIME=$(uptime | awk '{print $3}' | sed 's/,//')
    UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
    IP=$(hostname -I | awk '{print $1}')
    MASK=$(ifconfig | grep $(hostname -I | awk '{print $1}') | awk '{print $4}')
    GATEWAY=$(ip route | grep default | awk '{print $3}')
    RAM_TOTAL=$(free -m | awk '/Mem:/{printf "%.3f GB", $2/1024}')
    RAM_USED=$(free -m | awk '/Mem:/{printf "%.3f GB", $3/1024}')
    RAM_FREE=$(free -m | awk '/Mem:/{printf "%.3f GB", $4/1024}')
    SPACE_ROOT=$(df | grep /$ | awk '{printf "%.2f MB", $2/1024}')
    SPACE_ROOT_USED=$(df | grep /$ | awk '{printf "%.2f MB", $3/1024}')
    SPACE_ROOT_FREE=$(df | grep /$ | awk '{printf "%.2f MB", $4/1024}')
}

print_info() {
    echo HOSTNAME = ${HOSTNAME}
    echo TIMEZONE = ${TIMEZONE}
    echo USER = ${USER}
    echo OS = ${OS}
    echo DATE = ${DATE}
    echo UPTIME = ${UPTIME}
    echo UPTIME_SEC = ${UPTIME_SEC}
    echo IP = ${IP}
    echo MASK = ${MASK}
    echo GATEWAY = ${GATEWAY}
    echo RAM_TOTAL = ${RAM_TOTAL}
    echo RAM_USED = ${RAM_USED}
    echo RAM_FREE = ${RAM_FREE}    
    echo SPACE_ROOT = ${SPACE_ROOT}
    echo SPACE_ROOT_USED = ${SPACE_ROOT_USED}
    echo SPACE_ROOT_FREE = ${SPACE_ROOT_FREE}
}