#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# $1 = file name
# $2 = containing path
function moveFilesHome () {
    if [ -f ~/$1 ]; then
        rm -f ~/$1
        
        if [ -f ~/$1 ]; then
            echo "Error: File still exists ~/$1"
        else 
            echo "Successfully deleted ~/$1"
        fi
    else
        echo "File doesn't exist: ~/$1"
    fi
}

#  Move bash files to home directory
for file in $(find ./bash -type f -exec basename {} \;)
do
    moveFilesHome $file bash
done
