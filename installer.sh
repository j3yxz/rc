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
elif [[ $choice == "zshrc" ]]; then
    echo "Installing .zshrc..."
    # Add commands to install .zshrc here
elif [[ $choice == "both" ]]; then
    echo "Installing .vimrc and .zshrc..."
    # Add commands to install both .vimrc and .zshrc here
else
    echo "Invalid choice. Please choose either vimrc, zshrc, or both."
fi
