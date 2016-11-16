# COLOR PROMPT SETUP
# ###################################################################
# set variable identifying the chroot you work in (used in the prompt below)
export TERM=xterm

if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Test for color support
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
else
  color_prompt=
fi

# COMMAND PROMPT
# ###################################################################
# Must be set to zero in case it was previously set
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
    PS1="${BLUE}\u@\h \w ${RED}(ROOT!!) ~~~~>${LIGHTGREY} "
  else 
    PROMPT_COMMAND='__git_ps1 "\n${DARKGREY}\w" "\n${LIGHTGREY}\u@\h: ${LIGHTGREY}" "|%s"'
  fi
else
	PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$(__git_ps1)\$ "
fi

