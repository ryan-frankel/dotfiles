# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

export PROMPT_COMMAND="history -a; history -c; history -r $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
export TERM=xterm
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

source ~/dotfiles/bashrc/.git-prompt.sh
source ~/code/z/z.sh

# COMMAND PROMPT
# ###################################################################
#PROMPT_DIRTRIM=2

BLUE="\[\033[0;34m\]"
GREEN="\[\033[0;32m\]"
CYAN="\[\033[0;36m\]"
RED="\[\033[0;31m\]"
PURPLE="\[\033[0;35m\]"
BROWN="\[\033[0;33m\]"
LIGHTGREY="\[\033[0;37m\]"
DARKGREY="\[\033[1;30m\]"
LIGHTBLUE="\[\033[1;34m\]"
LIGHTGREEN="\[\033[1;32m\]"
LIGHTCYAN="\[\033[1;36m\]"
LIGHTRED="\[\033[1;31m\]"
LIGHTPURPLE="\[\033[1;35m\]"
YELLOW="\[\033[1;33m\]"
WHITE="\[\033[1;37m\]"
GIT="\$(__git_ps1)"

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_STATESEPARATOR="${DARKGREY}|"
GIT_PS1_SHOWCOLORHINTS=1

if [ "$color_prompt" = yes ]; then
  if [ $(id -u) -eq 0 ]; then # YOU ARE ROOT
    PS1="${debian_chroot:+($debian_chroot)}\[\033[00;31m\]\h\[\033[00m\]:\[\033[00;31m\]\w\[\033[00;32m\]\[\033[00m\] (ROOT!!) ~~~~> "
  else 
    #PS1="${debian_chroot:+($debian_chroot)}\[\033[01;30m\]\h\[\033[00m\]:\[\033[01;37m\]\w\[\033[00;36m\]\$(__git_ps1)\[\033[00;32m\]\[\033[00m\] "
    #PS1="\n${DARKGREY}\w${CYAN}${GIT}\n${LIGHTGREY}\u@\h: "
    PROMPT_COMMAND='__git_ps1 "\n${DARKGREY}\w" "\n${LIGHTGREY}\u@\h: ${LIGHTGREY}" "|%s"'
  fi
else
	PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$(__git_ps1)\$ "
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/dotfiles/bashrc/.bash_aliases ]; then
    . ~/dotfiles/bashrc/.bash_aliases
fi

if [ -f ~/dotfiles/bashrc/.bash_site_aliases ]; then
    . ~/dotfiles/bashrc/.bash_site_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/etc/apache2/
VIMRC=~/.vimrc
export VIMRC

# disable START/STOP signals
stty -ixon

#export NVM_DIR="/home/pj/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#nvm use iojs

# Update the colors for the LS command
#If on a mx
if [ "$(uname)" == "Darwin" ]; then
  export CLICOLOR=1
  export LSCOLORS=gxfxcxdxbxegedabagacad
else
  LS_COLORS=$LS_COLORS:'no=0;90:di=0;96:fi=0;37:ln=0;95:ex=0;91:' ; export LS_COLORS
fi

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
