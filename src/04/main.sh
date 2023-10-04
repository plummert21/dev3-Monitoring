#!/bin/bash

source check_input.sh
source color.sh
source info.sh

#Default config color flag
CFG_DEFAULT=0;

check_input "$@"

if [[ $? -eq 0 ]]
then
   get_info
   set_colors
   print_info
   echo ""
   print_color_info
fi