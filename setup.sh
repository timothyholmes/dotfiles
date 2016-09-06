#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# $1 = file name
# $2 = containing path
function fileMover () {
    if [ -f ~/$1 ]; then
        echo "File Already Exists: ~/$1 "
    else
        cp $DIR/$2/$1 ~/$1

        if [ -f ~/$1 ]; then
            echo "Successfully created ~/$1"
        else 
            echo "Error: ~/$1 not created"
        fi
    fi
}

#To-Do: loop through bash and run function
fileMover .bash_aliases bash
fileMover .git-completion.bash bash
fileMover .git-prompt.sh bash
fileMover .vimrc bash
fileMover .bash_profile bash

if [ -d ~/.nvm ]; then
    echo "nvm already installed"
else
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash
    
    if [ -d ~/.nvm ]; then
        echo "nvm installed successfully"
        nvm install v4
        nvm alias default v4
    else
        echo "nvm not installed"
    fi
fi
