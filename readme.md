Installs and compiles my dotfiles. Tested on Ubuntu 12.04 and 16.04.

## Basic Usage
The domain for automatically downloading this project is frankel.sh. You can 
grab the repo and execute the basic installation with the following command.

`curl frankel.sh | bash`

The will download this git repo to ~/dotfiles/ and will run index.html (which
is a bash script).

The reason for index.html is to serve as a hosted file with GitHub 
pages that the DNS server can point to.  This allows the simple curl
request.

## Help
There are options for installing cmake, vim8.0 and YouCompleteMe. To access the 
help screen simply type:

`./index.html --help`

This should output:
```
vim - compile vim and install all bundles
updatevim - Updates vim bundles and vimrc
cmake - install new version of cmake
ycm - install youcompleteme
tools - install basic tools
all - INSTALL ALL THE ABOVE
```

## Use at Your Own Risk
These settings are mine, and how I like Bash/Vim/etc set up. There is 
nearly a 100% chance you would like your settings to be different.

## Basic Tools Used
### Bashrc
  * Two line bash prompt with username, server, current directory, and Git prompt
  * Bash Prompt shows status of Git Repo. Red is changed/added, Yellow is yet
    to be commited.  Green is the branch name.
  * Check out ./bashrc/aliases.sh for the CLI aliases
  * Custom colors for LS
  * NVM
  * Z
  * Various functions in ./bashrc/functions.sh

### Tools
  * curl
  * build-essential
  * git
  * bc
  * dtrx
  * ncdu
  * htop
  * trash-cli

### Vim
  * Spaces over tabs 
  * 2 Spaces for tabs
  * Space mapleader
  * Vundle
  * Wombat256Mod ColorScheme
  * Line numbers on by default
  * NerdTree Open By Default

#### Plugins
  * NerdTree
  * NerdCommenter
  * CtrlP
  * Matchit
  * EasyMotion [w/ s and / mappings]
  * YouCompleteMe
  * GitGutter
  * PolyGlot
  * Tabular
  * Snipmate
  * Syntastic

