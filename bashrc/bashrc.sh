# If not running interactively, don't do anything
# ###################################################################
[ -z "$PS1" ] && return

# MISC
# ###################################################################
# check the window size after each command and adjust
shopt -s checkwinsize

# disable START/STOP signals
stty -ixon

# LOAD COLORS
# ###################################################################
source ~/dotfiles/bashrc/colors.sh

# HISTORY SETTINGS
# ###################################################################
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
HISTSIZE=5000
HISTFILESIZE=10000
#export PROMPT_COMMAND="history -a; history -c; history -r $PROMPT_COMMAND"

# PROMPT
# ###################################################################
source ~/dotfiles/bashrc/bash-prompt.sh

# ALIAS DEFINITIONS
# ###################################################################
if [ -f ~/dotfiles/bashrc/aliases.sh ]; then
  source ~/dotfiles/bashrc/aliases.sh
fi

if [ -f ~/dotfiles/bashrc/site-aliases.sh ]; then
  source ~/dotfiles/bashrc/site-aliases.sh
fi

# DIRENV
# ###################################################################
eval "$(direnv hook bash)"

# BASH COMPLETION
# ###################################################################
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  source /etc/bash_completion
fi

# PATH
# ###################################################################
PATH=$PATH:/etc/apache2/

# LS COLORS
# ###################################################################
# If on a mac
if [ "$(uname)" == "Darwin" ]; then
  export CLICOLOR=1
  export LSCOLORS=gxfxcxdxbxegedabagacad
else
  LS_COLORS="di=${dir}:fi=${file}:no=${file}:ln=${link}:ex=${exe}:*.sh=${shell}"
  export LS_COLORS
fi

# Node Version Manager
# ###################################################################
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# GIT PROMPT
# ###################################################################
source ~/dotfiles/bashrc/git-prompt.sh

# z
# ###################################################################
source ~/code/z/z.sh

# FUNCTIONS
# ###################################################################
source ~/dotfiles/bashrc/functions.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/rfrankel/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/rfrankel/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/rfrankel/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/rfrankel/google-cloud-sdk/completion.bash.inc'
fi

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
