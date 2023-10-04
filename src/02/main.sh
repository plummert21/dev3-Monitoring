#!/bin/bash

source info.sh
source save_in_file.sh

./check_input.sh $@

if [[ $? -eq 0 ]]
then
    get_info
    print_info
    save_in_file
fi