#!/bin/bash
################################################################################
# Script Name	:
# Description	:
# Arguments		:
# Author		: James M Conroy
################################################################################

# Creat a symbolic link between ~/.vimrc and ~/.vim/vimrc
ln -s ~/.vim/vimrc ~/.vimrc

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install Plugins through Vundle
vim +PluginInstall +qall
