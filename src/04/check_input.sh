#!/bin/bash

source color.cfg

#количество возможных элементов
ARGS_COUNT=0

check_input() {
    if [[ $# -ne $ARGS_COUNT ]]; then
	    echo Input error
        exit 1
    elif [ -z "$column1_background" ] || [ -z "$column1_font_color" ] || [ -z "$column2_background" ] || [ -z "$column2_font_color" ]; then
        CFG_DEFAULT=1;
    elif [[ ${column1_background} -eq ${column1_font_color} ]]; then
	    echo Input error: same parameters color in column1
        echo Change config file and run the script with
        echo $column1_background
        echo $column1_font_color
        exit 1
    elif [[ ${column2_background} -eq ${column2_font_color} ]]; then
	    echo Input error: same parameters color in column2
        echo Change config file and run the script with
        exit 1
    fi
}