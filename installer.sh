#!/bin/bash

RC_DIR=$(echo $0 | sed -E 's/installer.sh//')

if [[ $# = 0 ]]; then
    echo "Usage: ./install.sh <choice>"
    echo 'choice is one of the following: "vimrc", "zshrc", "all".'
    read -p "Which configuration file(s) would you like to install? (vimrc/zshrc/both): " choice
else
    choice=$1
fi


if [[ $choice == "vimrc" ]]; then
    echo "Installing .vimrc..."
    # Add commands to install .vimrc here
    # check if vim is installed
    if ! [ -x "$(command -v vim)" ]; then
        echo "Vim is not installed. Please install vim and try again."
        exit 1
    fi
    # check if .vimrc is present
    vimrc_files=$(vim --version | grep "user vimrc file" | sed -E 's/.*: "(.*)"/\1/' )
    for name in $vimrc_files; do
        name=$(echo $(eval "echo $name"))
        if [[ -f $name ]]; then
            echo "Vimrc file found at " $name
            echo "Importing .vimrc into " $name, backup as $RC_DIR$name.bak
            mv $name $RC_DIR$name.bak
            cat .vimrc >> $name
            echo "Done."
            vimrc_primary=$name
            break
        fi
    done
    if [[ -z $vimrc_primary ]]; then
        vimrc_primary=$(echo $vimrc_files | cut -d' ' -f1)
        vimrc_primary_dir = $(echo $vimrc_primary | sed -E s'/.vimrc//')
        vim_primary_dir = $(eval "echo $vim_primary_dir")
        echo "Vimrc file not found. Creating importing \".vimrc\" into " $vim_primary_dir
        cp .vimrc $vim_primary_dir
    fi
    
elif [[ $choice == "zshrc" ]]; then
    echo "Installing .zshrc..."
    # Add commands to install .zshrc here
elif [[ $choice == "both" ]]; then
    echo "Installing .vimrc and .zshrc..."
    # Add commands to install both .vimrc and .zshrc here
else
    echo "Invalid choice. Please choose either vimrc, zshrc, or both."
fi
