# NAVIGATION
# #########################################
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias c='clear'
alias h='history'

# Z
# #########################################
source ~/code/z/z.sh

# TRASH
# #########################################
#alias rm='trash'

# LS ALIASES
# #########################################
alias ll='ls -alFh'
alias la='ls -lah'
alias l='ls -lFh'

# GREP
# #########################################
alias grep='grep --color=auto'
alias hg='history | grep'
alias gh='history | grep'

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
# Push Master
alias gpm='git push origin master'
# Pull Master
alias gplm='git pull origin master'
# Push Current Branch
alias gpb='git push origin $(current-branch)'
# Pull Current Branch
alias gplb='git pull origin $(current-branch)'

# SERVICES, LOGIN, ETC ALIASES
# #########################################
alias netstat='netstat -plutn'
alias ra='sudo service apache2 reload' 
alias rv='sudo service varnish reload' 
alias cron='ssh 50.56.174.184'
alias coupons='ssh 166.78.136.18'
alias da='mosh datingadvice.com'
alias pr='mosh printaholic.com'
alias bc='mosh 166.78.243.119'
alias ha='mosh hostingadvice.com'
alias cr='mosh cardrates.com'
alias db='mosh digitalbrands.com'
alias wd='ssh weirddads@weirddads.com'
alias dc='mosh dealcrunch.com'
alias dc-old='mosh 162.242.144.214'
alias docs='mosh docentuser@db-docs.com'
alias ro='mosh http://169.55.197.105/'
alias sd-dev='mosh doppleruser@159.203.73.119'
alias pullrm='git subtree pull --prefix=plugins/rain-maker git@github.com:digital-brands/rain-maker.git master'
alias pushrm='git subtree push --prefix=plugins/rain-maker git@github.com:digital-brands/rain-maker.git master'
#alias monsoon='php ~/monsoon-php/monsoon.php'
alias update='sudo apt-get update && sudo apt-get upgrade -y && cd ~/bashrc && gplm && cd - && cd ~/vimrc/ && gplm && vim -c PluginCLean -c q -c q && vim -c PluginInstall -c q -c q && cd -'
alias less-upgrade='sudo npm install -g less@1.7.4'
alias less-downgrade='sudo npm install -g less@1.3.3'
alias doit='sudo $(history -p \!\!)'
alias ex='exit';
alias setperm='sudo chgrp -R www-data public_html/ && sudo chmod -R g+w public_html/ && sudo find public_html/ -type d -exec sudo chmod g+s {} \; && sudo chown -R www-data public_html/ && sudo find public_html/ -path "*/functions/scripts/*" -exec chown db-dev {} \; && sudo find public_html/ -path "*/functions/scripts/*" -exec chgrp db-dev {} \;';
alias setdbdev='sudo find public_html/ -path "*/functions/scripts/*" -exec chown db-dev {} \; && sudo find public_html/ -path "*/functions/scripts/*" -exec chgrp db-dev {} \;'
alias purge='curl -X PURGE $1';
alias ni='git commit -m "New Images"';
alias snippets='vim ~/.vim/bundle/vim-snippets/UltiSnips/';
alias vimrc='vim ~/vimrc/.vimrc';
alias tmux-reload='tmux source-file ~/.tmux.conf';
alias weather='curl http://wttr.in/32601';
alias www-data='sudo chown www-data * && sudo chgrp www-data *';
alias logs="cd $WP_DIR && cd ../../logs/ && ll"
alias ctags-gen="ctags -R -f .git/tags ."
alias w3tc="wp plugin toggle w3-total-cache"


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

# MONSOON
# #########################################
alias monsoon="docker-compose run monsoon php monsoon.php"
