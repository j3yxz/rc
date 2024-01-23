#!/bin/bash
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
        if [[ -f $name ]]; then
            echo "Vimrc file found at " $name
            echo "Importing .vimrc into " $name, backup as $name.bak
            mv $name $name.bak
            cat .vimrc >> $name
            echo "Done."
            vimrc_primary=$name
            break 
    if [[ -z $vimrc_primary ]]; then
        vimrc_primary=$(echo $vimrc_files | cut -d' ' -f1)
        echo 'Vimrc file not found. Creating importing ".vimrc" into ' $(echo $vimrc_file | awk '{print $1} ).'
        cp .vimrc ~/
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
