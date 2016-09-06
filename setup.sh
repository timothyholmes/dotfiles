#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# $1 = file name
# $2 = containing path
function fileMover () {
    if [ -f ~/$1 ]; then
        echo "$1 exists "
    else
        cp $DIR/$2/$1 ~/$1

        if [ -f ~/$1 ]; then
            echo "Successfully created ~/$1"
        else 
            echo "Error: ~/$1 not created"
        fi
    fi
}

#for file in $(ls ./bash/)
for file in $(ls $DIR/bash)
do 
    echo "file:  $file"
done

echo $DIR/bash

#fileMover caladan.terminal bash
#fileMover 
