#!/bin/bash

#количество возможных элементов
ARGS_COUNT=4

#регулярное выражение для чисел (целых и десятичных).
re='^[^1-6]$'

check_input() {
    if [[ $# -ne $ARGS_COUNT ]]; then
	    echo Input error
        exit 1
    elif  [[ $1 =~ $re ]] || [[ $2 =~ $re ]]  || [[ $3 =~ $re ]] || [[ $4 =~ $re ]]; then
	    echo Input error
        exit 1
    elif [[ $1 -eq $2 ]]; then
	    echo Input error: same parameters color in column1
        echo Run the script with the correct parameters
        exit 1
    elif [[ $3 -eq $4 ]]; then
	    echo Input error: same parameters color in column2
        echo Run the script with the correct parameters
        exit 1
fi
}