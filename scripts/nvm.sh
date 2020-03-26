#!/bin/zsh

# Install NVM
if [ -d ~/.nvm ]; then
    echo "nvm already installed"
else
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash

    if [ -d ~/.nvm ]; then
        echo "nvm installed successfully"

        source ~/.zshrc
        source ~/.nvm/nvm.sh

        nvm install --lts
        nvm install 12.13.0
        nvm alias default 12.13.0
    else
        echo "Error: nvm not installed"
    fi
fi
