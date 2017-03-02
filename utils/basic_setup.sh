# SETUP, GIT, ADD THE REPO
# ###################################################################
function basic_setup() {
  tools="curl build-essential git bc dtrx ncdu htop trash-cli" 
  # silversearcher-ag
  mactools="curl build-essential git bc dtrx ncdu htop trash-cli the_silver_searcher"

  define_colors

  if isosx; then
    which -s brew
    if [[ $? != 0 ]]; then
      ech "- Installing Homebrew..."
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    ech "- Install Tools..."
    brew install --quieter $mactools &> /dev/null
  fi

  # LINUX BASICS
  # #############################################################
  if islinux; then
    ech "- APT update..."
    sudo apt-get update

    ech "- Install Tools.."
    sudo apt-get install $tools -y
  fi

  # GET REPO
  # #############################################################
	if [ ! -d ~/dotfiles ]; then
		ech "- Cloning dotfiles..."
		git clone --quiet https://github.com/ryan-frankel/dotfiles ~/dotfiles
		cd ~/dotfiles
	else
		ech "- Pulling dotfiles..."
		cd ~/dotfiles
		git pull --quiet origin master 
	fi
}
