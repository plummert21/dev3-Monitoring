#!/bin/bash

printLine() {
    number=0
    folder_num=1
    for Line in $Var
    do
        if [[ $number -eq 0 ]]
        then
            if [[ $file == "1" ]]
            then
                echo -n "$folder_num - $Line, "
            else
                echo -n "$folder_num - $Line/, "
            fi
            number=$(($number+1))
        elif [[ $number -eq 1 ]]
        then
            echo -n "$Line "
            number=$(($number+1))
        else
            echo "$Line"
            number=0
            folder_num=$(($folder_num+1))
        fi
    done
}

get_info() {
    # 2>/dev/null - перенаправляет все ошибки в /dev/null. Для этого в конце вашей команды просто дописываем: 2>/dev/null
    TIME_START=$(date +%s%3N)
    FOLDER_COUNT=$(find $DIR -type d 2>/dev/null | wc -l)
    FOLDER_MAX=$(find $DIR -type d -exec du -h {} + 2>/dev/null | sort -rh | head -n 5 | awk '{print $2,$1}' | sed 's/G$/ GB/g;s/M$/ MB/g;s/K$/ KB/g')
    FILES_COUNT=$(find $DIR -type f 2>/dev/null | wc -l)
    FILE_CONF=$(find $DIR -type f -iname *.conf 2>/dev/null | wc -l)
    FILE_EXE=$(find $DIR -type f -perm /a=x 2>/dev/null | wc -l)
    FILE_TXT=$(find $DIR -type f -iname *.txt 2>/dev/null | wc -l)
    FILE_LOG=$(find $DIR -type f -iname *.log 2>/dev/null | wc -l)
    FILE_ARCH=$(find $DIR -type f 2>/dev/null | grep -E '\.(zip|tar|gz|bz2|rar)$' | wc -l)
    FILE_L=$(find $DIR -type l 2>/dev/null | wc -l)
    FILE_MAX=$(find $DIR -type f -exec du -h {} + 2>/dev/null | sort -rh | head -n 10 | awk '{print $2,$1}' | sed 's/G$/ GB/g;s/M$/ MB/g;s/K$/ KB/g')
    FILE_MAX_EXE=$(find $DIR -type f -perm /a=x -exec du -h {} + 2>/dev/null | sort -rh | head -n 10 | awk '{print $2,$1}' | sed 's/G$/ GB/g;s/M$/ MB/g;s/K$/ KB/g')
    TIME_END=$(date +%s%3N)
    DIFF_TIME=$(($TIME_END-$TIME_START))
}

print_info() {
    # 1
    echo "Total number of folders (including all nested ones) = ${FOLDER_COUNT}"
    # 2
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
    file="0"
    Var=$FOLDER_MAX
    printLine $FOLDER_MAX $file
    # 3
    echo "Total number of files = ${FILES_COUNT}"
    # 4
    echo "Number of:"
    echo "Configuration files (with the .conf extension) = $FILE_CONF"
    echo "Text files = $FILE_TXT"
    echo "Executable files = $FILE_EXE"
    echo "Log files (with the extension .log) = $FILE_LOG"
    echo "Archive files = $FILE_ARCH"
    echo "Symbolic links = $FILE_L"
    # 5
    echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
    file="1"
    Var=$FILE_MAX
    printLine $Var $file
    # 6
    echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
    file="1"
    Var=$FILE_MAX_EXE
    printLine $Var  $file
    # 7
    DIFF_TIME=$(($DIFF_TIME/100))
    echo $DIFF_TIME 10 | awk '{print "Script execution time (in seconds) = ", $1/$2}'
    # echo $DIFF_TIME 1000 | awk '{print "Script execution time (in seconds) = ", $1/$2}'
}