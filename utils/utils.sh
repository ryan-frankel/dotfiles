# DEFINE BANNER
# ###################################################################
function banner() {
  echo -e "${DARKGRAY}"
  echo -e ".8888b                            dP                dP             dP       "
  echo -e "88   '                            88                88             88       "
  echo -e "88aaa  88d888b. .d8888b. 88d888b. 88  .dP  .d8888b. 88    .d8888b. 88d888b. "
  echo -e "88     88'  '88 88'  '88 88'  '88 88888'   88ooood8 88    Y8ooooo. 88'  '88 "
  echo -e "88     88       88.  .88 88    88 88  '8b. 88.  ... 88          88 88    88 "
  echo -e "dP     dP       '88888P8 dP    dP dP   'YP '88888P' dP 88 '88888P' dP    dP "
  echo -e "----------------------------------------------------------------------------"
  echo -e "${CURSOR}"
}

# DEFINE COLORS
# ###################################################################
function define_colors {
  GREEN="\033[38;05;70m"
  PURPLE="\033[38;05;93m"
  LIGHTPURPLE="\033[38;05;105m"
  LIGHTGRAY="\033[38;05;248m"
  DARKGRAY="\033[38;05;236m"
  CURSOR="\033[00m";
  CURSOR="${LIGHTGRAY}"
}

# FUNCTION FOR ECHO WITH COLOR OPTION
# ###################################################################
function ech() {
	if [ -z "$2" ]; then
		echo -e " ${GREEN}$1${CURSOR}";
	else
		echo -e "${CURSOR}$1${CURSOR}";
	fi
}

# FUNCTION TO TEST FOR OSX/LINUX/ETC
# ###################################################################
function isosx() {
  if [[ $OSTYPE == *"darwin"* ]]; then
    return 0; # true
  else
    return 1; # false
  fi
}

function islinux() {
  if [[ $OSTYPE == *"linux"* ]]; then
    return 0; # true
  else
    return 1; # false
  fi
}

# FUNCTION FOR COMPARING VERSIONS
# ###################################################################
function should_upgrade() {
    if [[ $1 == $2 ]]
    then
        return 1
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]]
        then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]}))
        then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            return 0
        fi
    done
    return 1
}
