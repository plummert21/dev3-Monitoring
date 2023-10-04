#!/bin/bash

#количество возможных элементов
ARGS_COUNT=1

check_input() {
    dir=$1
    length=${#dir}
    if [[ $# -ne ${ARGS_COUNT} ]]; then
	    echo Input error
        exit 1
    elif [[ ! -d $DIR ]]; then
	    echo Input error
        exit 1
    elif  [[ ${dir:length-1} != "/" ]] ; then
	    echo Input error
        exit 1
    fi
}