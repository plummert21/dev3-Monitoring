#!/bin/bash

save_in_file() {
    read -p "Save status in file? (Y/N) " answer
    if [[ ${answer} == "Y" ]] || [[ ${answer} == "y" ]]
    then
        FILE_NAME=$(pwd)/$(date +"%d_%m_%y_%H_%M_%S").status
        print_info > ${FILE_NAME}
    fi
}




