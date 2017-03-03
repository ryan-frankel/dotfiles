Installs and compiles my dotfiles. Tested on Ubuntu 12.04 and 16.04.

## Basic Usage
The domain for automatically downloading this project is frankel.sh. You can 
grab the repo and execute the basic installation with the following command.

`curl frankel.sh | bash`

The will download this git repo to ~/dotfiles/ and will run install.sh.

The reason for index.html is to serve as a hosted file with GitHub 
pages that the DNS server can point to.  This allows the simple curl
request.

## Help
There are options for installing cmake, vim8.0 and YouCompleteMe. To access the 
help screen simply type:

`./install.sh --help`

This should output:
```
vim - compile vim and install all bundles
cmake - install new version of cmake
ycm - install youcompleteme
tools - install basic tools
all - INSTALL ALL THE ABOVE
```

## Use at Your Own Risk
These settings are mine, and how I like Bash/Vim/etc set up. There is 
nearly a 100% chance you would like your settings to be different.
