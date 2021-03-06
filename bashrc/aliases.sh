# NAVIGATION
# #########################################
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias c='clear'
alias h='history'
alias updatesAvailable='sudo /etc/update-motd.d/90-updates-available && [ -f /var/run/reboot-required  ] && cat /var/run/reboot-required'

# Z
# #########################################
source ~/code/z/z.sh

# TRASH
# #########################################
#alias rm='trash'

# TMUX
# #########################################
alias tmux="tmux -2"

# LS ALIASES
# #########################################
alias ll='ls -alFh --group-directories-first'
alias la='ls -lah --group-directories-first'
alias l='ls -lFh --group-directories-first'

case "$OSTYPE" in
  darwin*) 
    alias ll='ls -alFh'
    alias la='ls -lah'
    alias l='ls -lFh'
    ;;
  *)
    alias ll='ls -alFh --group-directories-first'
    alias la='ls -lah --group-directories-first'
    alias l='ls -lFh --group-directories-first'
    ;;
esac

# GREP
# #########################################
alias grep='grep --color=auto'
alias hg='history | grep'
alias gh='history | grep'

# #####################################################
# Googler
# #####################################################
alias g='googler'

# GIT ALIASES
# #########################################
alias current-branch='git rev-parse --abbrev-ref HEAD'
alias gb='git branch'
alias gbl='git branch -r'
alias gs='git status'
alias gl='git log --pretty=format:"%C(bold green)%h %ad%C(red)%d %Creset%s%C(bold blue) [%cn]" --decorate --date=relative'
#alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
alias gll='git log --pretty=format:"%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]" --decorate --numstat'
alias ga='git add'
alias gaa='git add -A .'
alias gam='git commit -am'
alias gm='git commit -m'
alias gamp='function _gamp() { gam "$1"; gpb; };_gamp'
alias gc='git checkout'
alias gcb='git checkout -b'
alias grm='git rm $(git ls-files --deleted)  '
alias gd='git diff'
# Push Master
alias gpm='git push origin master'
# Pull Master
alias gplm='git pull origin master'
# Push Current Branch
alias gpb='git push origin $(current-branch)'
# Pull Current Branch
alias gplb='git pull origin $(current-branch)'

# Get to the top of a git tree
cdg () {
  TEMP_PWD=`pwd`
  while ! [ -d .git ]; do
  cd ..
  done
  OLDPWD=$TEMP_PWD
}

cdtasks () {
  TEMP_PWD=`pwd`
  while ! [ -d .git ]; do
  cd ..
  done
  cd ./tasks
  OLDPWD=$TEMP_PWD
}


# SERVICES, LOGIN, ETC ALIASES
# #########################################
alias netstat='netstat -plutn'
alias update='sudo apt update && sudo apt upgrade -y && cd ~/dotfiles && git pull origin master && ./index.html'
alias doit='sudo $(history -p \!\!)'
alias snippets='vim ~/.vim/bundle/vim-snippets/UltiSnips/';
alias vimrc='vim ~/vimrc/.vimrc';
alias weather='curl http://wttr.in/32601';
alias ctagsGen="ctags -R -f .git/tags ."
alias w3tc="wp plugin toggle w3-total-cache"
alias ipget="curl -s icanhazip.com"
alias getip="curl -s icanhazip.com"
alias ct="sudo crontab -e -udb-admin"

# Gets the scp path for a file
getscp () {
  { echo $(getip); echo ":"; echo $(readlink -f $1); } | tr -d "\n"
}

if [ -n "$THEME_DIR" ];
    then alias warm="cd ${THEME_DIR}functions/warmer/&& ./build-sitemaps-and-warm-cache.sh && cd -";
fi

# COLOR SUPPORT
# #########################################
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# DOCKER
# #########################################
alias dvl="docker volume ls"
alias dvld="docker volume ls -f dangling=true"
alias dvr="docker volume rm"
alias ddd="docker volume ls -qf dangling=true"
alias dvrd="docker volume rm ddd"

alias dcu="docker-compose up"
alias dcb="docker-compose build"
alias dcr="docker-compose run"
alias dcd="docker-compose down"
alias dcs="docker-compose start"
alias dcst="docker-compose stop"

alias deit="docker exec -it"
alias drit="docker run -it"

alias dps="docker ps"
alias dim="docker images"

alias stopandremove="dstop && drm"

alias dcl='docker-compose logs -f'

# MONSOON
# #########################################
alias monsoon="docker-compose run monsoon php monsoon.php"
alias monsoonOld='php ~/monsoon-php/monsoon.php'

# GAMES 
# #########################################
alias 2048="~/dotfiles/games/bash2048/bash2048.sh"

dstop() { docker stop $(docker ps -aq); }
drm() { docker rm $(docker ps -a -q); }
