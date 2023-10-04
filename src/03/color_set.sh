#!/bin/bash

#1 белый
WHITE_P=97
WHITE_P_B=107

#2 красный
RED_P=31
RED_P_B=41

#3 зеленый
GREEN_P=32
GREEN_P_B=42

#4 синий
BLUE_P=34
BLUE_P_B=44

#5 фиолетовый
PURPLE_P=35
PURPLE_P_B=45

#6 черный
BLACK_P=30
BLACK_P_B=40

ENDCOLOR="\e[0m"


color_param_background() {
    case $1 in
        1) COLOR_PARAM_BACKGROUND=${WHITE_P_B};;
        2) COLOR_PARAM_BACKGROUND=${RED_P_B};;
        3) COLOR_PARAM_BACKGROUND=${GREEN_P_B};;
        4) COLOR_PARAM_BACKGROUND=${BLUE_P_B};;
        5) COLOR_PARAM_BACKGROUND=${PURPLE_P_B};;
        6) COLOR_PARAM_BACKGROUND=${BLACK_P_B};;
    esac
}

color_param() {
    case $2 in
        1) COLOR_PARAM=${WHITE_P};;
        2) COLOR_PARAM=${RED_P};;
        3) COLOR_PARAM=${GREEN_P};;
        4) COLOR_PARAM=${BLUE_P};;
        5) COLOR_PARAM=${PURPLE_P};;
        6) COLOR_PARAM=${BLACK_P};;
    esac
}

color_value_background() {
    case $3 in
        1) COLOR_VALUE_BACKGROUND=${WHITE_P_B};;
        2) COLOR_VALUE_BACKGROUND=${RED_P_B};;
        3) COLOR_VALUE_BACKGROUND=${GREEN_P_B};;
        4) COLOR_VALUE_BACKGROUND=${BLUE_P_B};;
        5) COLOR_VALUE_BACKGROUND=${PURPLE_P_B};;
        6) COLOR_VALUE_BACKGROUND=${BLACK_P_B};;
    esac
}

color_value () {
    case $4 in
        1) COLOR_VALUE=${WHITE_P};;
        2) COLOR_VALUE=${RED_P};;
        3) COLOR_VALUE=${GREEN_P};;
        4) COLOR_VALUE=${BLUE_P};;
        5) COLOR_VALUE=${PURPLE_P};;
        6) COLOR_VALUE=${BLACK_P};;
    esac
}

set_colors() {
    color_param_background "$@"
    color_param "$@"
    color_value_background "$@"
    color_value "$@"
    COLOR1="\e[${COLOR_PARAM_BACKGROUND};${COLOR_PARAM}m"
    COLOR2="\e[${COLOR_VALUE_BACKGROUND};${COLOR_VALUE}m"
}