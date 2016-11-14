# LS COLORS
LSBLUE="38;05;32"
LSGREEN="38;05;70"
LSCYAN="38;05;37"
LSRED="38;05;160"
LSPURPLE="38;05;99"
LSBROWN="38;05;94"
LSORANGE="38;05;166"
LSLIGHTGREY="38;05;250"
LSDARKGREY="38;05;240"
LSLIGHTBLUE="1;34"
LSLIGHTGREEN="1;32"
LSLIGHTCYAN="1;36"
LSLIGHTRED="38;05;9"
LSLIGHTPURPLE="1;35"
LSYELLOW="38;05;148"
LSWHITE="38;05;15"

# COLORS
BLUE="\[\033[${LSBLUE}m\]"
GREEN="\[\033[${LSGREEN}m\]"
CYAN="\[\033[${LSCYAN}m\]"
RED="\[\033[${LSRED}m\]"
PURPLE="\[\033[${LSPURPLE}m\]"
BROWN="\[\033[${LSBROWN}m\]"
ORANGE="\[\033[${LSORANGE}m\]"
LIGHTGREY="\[\033[${LSLIGHTGREY}m\]"
DARKGREY="\[\033[${LSDARKGREY}m\]"
LIGHTBLUE="\[\033[${LSLIGHTBLUE}m\]"
LIGHTGREEN="\[\033[${LSLIGHTGREEN}m\]"
LIGHTCYAN="\[\033[${LSLIGHTCYAN}m\]"
LIGHTRED="\[\033[${LSLIGHTRED}m\]"
LIGHTPURPLE="\[\033[${LSLIGHTPURPLE}m\]"
YELLOW="\[\033[${LSYELLOW}m\]"
WHITE="\[\033[${LSWHITE}m\]"


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# HISTORY SETTINGS
# ###################################################################
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length
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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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

# COMMAND PROMPT
# ###################################################################
PROMPT_DIRTRIM=0

# GIT PROMPT SETTINGS
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_STATESEPARATOR=" "
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT="\$(__git_ps1)"


if [ "$color_prompt" = yes ]; then
  if [ $(id -u) -eq 0 ]; then # YOU ARE ROOT
    #PS1="${debian_chroot:+($debian_chroot)}\[\033[00;31m\]\h\[\033[00m\]:\[\033[00;31m\]\w\[\033[00;32m\]\[\033[00m\] (ROOT!!) ~~~~> "
    PS1="${BLUE}\u@\h \w ${RED}(ROOT!!) ~~~~>${LIGHTGREY} "
  else 
    PROMPT_COMMAND='__git_ps1 "\n${DARKGREY}\w" "\n${LIGHTGREY}\u@\h: ${LIGHTGREY}" "|%s"'
  fi
else
	PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$(__git_ps1)\$ "
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    #;;
#*)
    #;;
#esac

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

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/etc/apache2/

#VIMRC=~/.vimrc
#export VIMRC

# disable START/STOP signals
stty -ixon

# Update the colors for the LS command
#If on a mx
if [ "$(uname)" == "Darwin" ]; then
  export CLICOLOR=1
  export LSCOLORS=gxfxcxdxbxegedabagacad
else
  dir="${LSGREEN}"
  file="${LSLIGHTGREY}"
  link="${LSBLUE}"
  exe="${LSRED}"
  shell="${LSLIGHTRED}"
  LS_COLORS="di=${dir}:fi=${file}:no=${file}:ln=${link}:ex=${exe}:*.sh=${shell}"
  export LS_COLORS
fi

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# SOURCE GIT PROMPT
source ~/dotfiles/bashrc/.git-prompt.sh

# SOURCE z
source ~/code/z/z.sh

# Source Functions
source ~/dotfiles/bashrc/.functions
