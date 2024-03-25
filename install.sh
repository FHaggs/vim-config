#!/bin/bash

# Update package list and upgrade existing packages
sudo apt-get update && sudo apt-get upgrade -y

# Install Vim if it's not already installed
if ! command -v vim &> /dev/null; then
    sudo apt-get install -y vim
fi

# Install xclip for clipboard access if it's not already installed
if ! command -v xclip &> /dev/null; then
    sudo apt-get install -y xclip
fi

# Install git if it's not already installed
if ! command -v git &> /dev/null; then
    sudo apt-get install -y git
fi

# Install fzf if it's not already installed
if ! command -v fzf &> /dev/null; then
    sudo apt-get install -y fzf
fi

# Install ripgrep for :Rg command if it's not already installed
if ! command -v rg &> /dev/null; then
    sudo apt-get install -y ripgrep
fi

# Install vim-plug plugin manager if it's not already installed
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Check if .vimrc exists and back it up if it does
if [ -f ~/.vimrc ]; then
    cp ~/.vimrc ~/.vimrc.backup.$(date +%F_%T)
fi

# Download the .vimrc file from the provided URL
curl -fLo ~/.vimrc --create-dirs \
    https://raw.githubusercontent.com/FHaggs/vim-config/master/.vimrc

# Install plugins using vim-plug
vim +PlugInstall +qall

echo "Vim and dependencies have been installed and configured."
