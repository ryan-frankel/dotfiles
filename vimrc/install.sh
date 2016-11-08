#!/bin/bash

# Delete Existing
rm -rf ~/.vimrc &> /dev/null
rm -rf ~/.vim/snippets &> /dev/null

# Symlink New
ln -s ~/vimrc/.vimrc ~/.vimrc
ln -s ~/vimrc/snippets ~/.vim/snippets 

# Install Vundle if Needed
sudo apt-get install curl vim -y
if [ ! -d ~/.vim/bundle/vundle/ ]; then
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle;
fi

# Create colors directory
if [ ! -d ~/.vim/colors ]; then
  mkdir ~/.vim/colors;
fi

# Download VIM theme
if [ ! -f ~/.vim/colors/wombat256mod.vim ]; then
  curl -L http://www.vim.org/scripts/download_script.php?src_id=13400 > ~/.vim/colors/wombat256mod.vim;
fi

# Install bundles
vim -c BundleInstall -c quitall
