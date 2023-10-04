#!/bin/bash

source color.cfg

#1 white
WHITE_P=97
WHITE_P_B=107

#2 red
RED_P=31
RED_P_B=41

#3 green
GREEN_P=32
GREEN_P_B=42

#4 blue
BLUE_P=34
BLUE_P_B=44

#5 purple
PURPLE_P=35
PURPLE_P_B=45

#6 black
BLACK_P=30
BLACK_P_B=40

#Reset color
ENDCOLOR="\e[0m"

#Default config color
COLOR_PARAM_BACKGROUND_DEFAULT=${WHITE_P_B}
COLOR_PARAM_BACKGROUND_NAME_DEFAULT="white"
COLOR_PARAM_DEFAULT=${RED_P}
COLOR_PARAM_NAME_DEFAULT="red"
COLOR_VALUE_BACKGROUND_DEFAULT=${GREEN_P_B}
COLOR_VALUE_BACKGROUND_NAME_DEFAULT="green"
COLOR_VALUE_DEFAULT=${BLUE_P}
COLOR_VALUE_NAME_DEFAULT="blue"

#Column1

color_param_background() {
    case ${column1_background} in
        1)  COLOR_PARAM_BACKGROUND=${WHITE_P_B}
            COLOR_PARAM_BACKGROUND_NAME="white" ;;
        2)  COLOR_PARAM_BACKGROUND=${RED_P_B}
            COLOR_PARAM_BACKGROUND_NAME="red" ;;
        3)  COLOR_PARAM_BACKGROUND=${GREEN_P_B}
            COLOR_PARAM_BACKGROUND_NAME="green" ;;
        4)  COLOR_PARAM_BACKGROUND=${BLUE_P_B}
            COLOR_PARAM_BACKGROUND_NAME="blue" ;;
        5)  COLOR_PARAM_BACKGROUND=${PURPLE_P_B}
            COLOR_PARAM_BACKGROUND_NAME="purple" ;;
        6)  COLOR_PARAM_BACKGROUND=${BLACK_P_B}
            COLOR_PARAM_BACKGROUND_NAME="black" ;;
        *) CFG_DEFAULT=1;;
    esac
}

color_param() {
    case ${column1_font_color} in
        1)  COLOR_PARAM=${WHITE_P}
            COLOR_PARAM_NAME="white" ;;
        2)  COLOR_PARAM=${RED_P}
            COLOR_PARAM_NAME="red" ;;
        3)  COLOR_PARAM=${GREEN_P}
            COLOR_PARAM_NAME="green" ;;
        4)  COLOR_PARAM=${BLUE_P}
            COLOR_PARAM_NAME="blue" ;;
        5)  COLOR_PARAM=${PURPLE_P}
            COLOR_PARAM_NAME="purple" ;;
        6)  COLOR_PARAM=${BLACK_P}
            COLOR_PARAM_NAME="black" ;;
        *) CFG_DEFAULT=1;;
    esac
}

#Column2

color_value_background() {
    case ${column2_background} in
        1)  COLOR_VALUE_BACKGROUND=${WHITE_P_B}
            COLOR_VALUE_BACKGROUND_NAME="white" ;;
        2)  COLOR_VALUE_BACKGROUND=${RED_P_B}
            COLOR_VALUE_BACKGROUND_NAME="red" ;;
        3)  COLOR_VALUE_BACKGROUND=${GREEN_P_B}
            COLOR_VALUE_BACKGROUND_NAME="green" ;;
        4)  COLOR_VALUE_BACKGROUND=${BLUE_P_B}
            COLOR_VALUE_BACKGROUND_NAME="blue" ;;
        5)  COLOR_VALUE_BACKGROUND=${PURPLE_P_B}
            COLOR_VALUE_BACKGROUND_NAME="purple" ;;
        6)  COLOR_VALUE_BACKGROUND=${BLACK_P_B}
            COLOR_VALUE_BACKGROUND_NAME="black" ;;
        *) CFG_DEFAULT=1;;
    esac
}

color_value () {
    case ${column2_font_color} in
        1)  COLOR_VALUE=${WHITE_P}
            COLOR_VALUE_NAME="white" ;;
        2)  COLOR_VALUE=${RED_P}
            COLOR_VALUE_NAME="red" ;;
        3)  COLOR_VALUE=${GREEN_P}
            COLOR_VALUE_NAME="green" ;;
        4)  COLOR_VALUE=${BLUE_P}
            COLOR_VALUE_NAME="blue" ;;
        5)  COLOR_VALUE=${PURPLE_P}
            COLOR_VALUE_NAME="purple" ;;
        6)  COLOR_VALUE=${BLACK_P}
            COLOR_VALUE_NAME="black" ;;
        *) CFG_DEFAULT=1;;
    esac
}


#Main function for set colors
set_colors() {
    color_param_background
    color_param
    color_value_background
    color_value
    if [[ ${CFG_DEFAULT} -eq 1 ]]; then
        COLOR_PARAM_BACKGROUND=${COLOR_PARAM_BACKGROUND_DEFAULT}
        COLOR_PARAM_BACKGROUND_NAME=${COLOR_PARAM_BACKGROUND_NAME_DEFAULT}
        COLOR_PARAM=${COLOR_PARAM_DEFAULT}
        COLOR_PARAM_NAME=${COLOR_PARAM_NAME_DEFAULT}
        COLOR_VALUE_BACKGROUND=${COLOR_VALUE_BACKGROUND_DEFAULT}
        COLOR_VALUE_BACKGROUND_NAME=${COLOR_VALUE_BACKGROUND_NAME_DEFAULT}
        COLOR_VALUE=${COLOR_VALUE_DEFAULT}
        COLOR_VALUE_NAME=${COLOR_VALUE_NAME_DEFAULT}
    fi
    COLOR1="\e[${COLOR_PARAM_BACKGROUND};${COLOR_PARAM}m"
    COLOR2="\e[${COLOR_VALUE_BACKGROUND};${COLOR_VALUE}m"
}

#Function for print color info

print_color_info() {
    if [[ ${CFG_DEFAULT} -eq 1 ]]; then
        echo "Column 1 background = default ("${COLOR_PARAM_BACKGROUND_NAME}")"
        echo "Column 1 font color = default ("${COLOR_PARAM_NAME}")"
        echo "Column 2 background = default ("${COLOR_VALUE_BACKGROUND_NAME}")"
        echo "Column 2 font color = default ("${COLOR_VALUE_NAME}")"
        echo "column1_background=1" > color.cfg
        echo "column1_font_color=2" >> color.cfg
        echo "column2_background=3" >> color.cfg
        echo "column2_font_color=4" >> color.cfg
    else
        echo "Column 1 background = "${column1_background}" ("${COLOR_PARAM_BACKGROUND_NAME}")"
        echo "Column 1 font color = "${column1_font_color}" ("${COLOR_PARAM_NAME}")"
        echo "Column 2 background = "${column2_background}" ("${COLOR_VALUE_BACKGROUND_NAME}")"
        echo "Column 2 font color = "${column2_font_color}" ("${COLOR_VALUE_NAME}")"
    fi
}