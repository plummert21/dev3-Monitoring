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
    echo -e ${COLOR1}HOSTNAME${ENDCOLOR} = ${COLOR2}${COLOR2}${HOSTNAME}${ENDCOLOR}
    echo -e ${COLOR1}TIMEZONE${ENDCOLOR} = ${COLOR2}${COLOR2}${TIMEZONE}${ENDCOLOR}
    echo -e ${COLOR1}USER${ENDCOLOR} = ${COLOR2}${COLOR2}${USER}${ENDCOLOR}
    echo -e ${COLOR1}OS${ENDCOLOR} = ${COLOR2}${OS}${ENDCOLOR}
    echo -e ${COLOR1}DATE${ENDCOLOR} = ${COLOR2}${DATE}${ENDCOLOR}
    echo -e ${COLOR1}UPTIME${ENDCOLOR} = ${COLOR2}${UPTIME}${ENDCOLOR}
    echo -e ${COLOR1}UPTIME_SEC${ENDCOLOR} = ${COLOR2}${UPTIME_SEC}${ENDCOLOR}
    echo -e ${COLOR1}IP${ENDCOLOR} = ${COLOR2}${IP}${ENDCOLOR}
    echo -e ${COLOR1}MASK${ENDCOLOR} = ${COLOR2}${MASK}${ENDCOLOR}
    echo -e ${COLOR1}GATEWAY${ENDCOLOR} = ${COLOR2}${GATEWAY}${ENDCOLOR}
    echo -e ${COLOR1}RAM_TOTAL${ENDCOLOR} = ${COLOR2}${RAM_TOTAL}${ENDCOLOR}
    echo -e ${COLOR1}RAM_USED${ENDCOLOR} = ${COLOR2}${RAM_USED}${ENDCOLOR}
    echo -e ${COLOR1}RAM_FREE${ENDCOLOR} = ${COLOR2}${RAM_FREE}${ENDCOLOR}    
    echo -e ${COLOR1}SPACE_ROOT${ENDCOLOR} = ${COLOR2}${SPACE_ROOT}${ENDCOLOR}
    echo -e ${COLOR1}SPACE_ROOT_USED${ENDCOLOR} = ${COLOR2}${SPACE_ROOT_USED}${ENDCOLOR}
    echo -e ${COLOR1}SPACE_ROOT_FREE${ENDCOLOR} = ${COLOR2}${SPACE_ROOT_FREE}${ENDCOLOR}
}