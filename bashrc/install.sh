#!/bin/bash

#DELETE EXISTING .bashrc IF THERE IS ONE
rm -rf ~/.bashrc &> /dev/null
rm -rf ~/.bash_profile &> /dev/null

#SYM LINK NEW .bashrc FILE
ln -s ~/bashrc/.bashrc ~/.bashrc
ln -s ~/bashrc/.bashrc ~/.bash_profile

#MAKE LOCAL .bash_site_aliases
#touch ~/.bash_site_aliases

#RELOAD .bashrc
source ~/.bashrc
