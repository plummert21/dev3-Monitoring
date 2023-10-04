#!/bin/bash

#количество возможных элементов
ARGS_COUNT=1

#регулярное выражение для чисел (целых и десятичных).
re='^[+-]?[0-9]+([.][0-9]+)?$'

if [[ $# -ne $ARGS_COUNT ]] ; then
	echo Input error
    exit 1
elif  [[ $1 =~ $re ]] ; then
	echo Input error
    exit 1
fi