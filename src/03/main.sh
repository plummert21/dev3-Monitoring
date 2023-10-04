#!/bin/bash

source check_input.sh
source color_set.sh
source info.sh

check_input "$@"

if [[ $? -eq 0 ]]
then
   get_info
   set_colors "$@"
   print_info
fi
