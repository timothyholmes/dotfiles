#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# $1 = file name
# $2 = containing path
function moveFilesHome () {
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

# To-Do: loop through bash and run function
# Move bash files to home directory
moveFilesHome .bash_aliases bash
moveFilesHome .git-completion.bash bash
moveFilesHome .git-prompt.sh bash
moveFilesHome .vimrc bash
moveFilesHome .bash_profile bash

# Install NVM
if [ -d ~/.nvm ]; then
    echo "nvm already installed"
else
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash
    source ~/.bash_profile
    
    if [ -d ~/.nvm ]; then
        echo "nvm installed successfully"
        nvm install v4
        nvm alias default v4
    else
        echo "Error: nvm not installed"
    fi
fi

# Source profile
source ~/.bash_profile
