#!/bin/bash

source check_input.sh
source info.sh

WD=$(pwd)
cd $1
DIR=$(pwd)
cd $WD

check_input "$@"

if [[ $? -eq 0 ]]
then
   get_info "$@"
   print_info
fi