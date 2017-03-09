# FUNCTION TO INSTALL TOOLS
# ###################################################################
function basic_tools() {
  clear
  define_colors
  banner

  ech "\nSetting Up..." 2
  ech "----------------------------------------------------------------------------" 2
  basic_setup

	ech "\nInstalling Node..." 2
  ech "----------------------------------------------------------------------------" 2
	install_node

	ech "\nInstalling CLI..." 2
  ech "----------------------------------------------------------------------------" 2
	install_cli

	ech "\nUpdate vimrc..." 2
  ech "----------------------------------------------------------------------------" 2
	update_vimrc

	ech "\nInstall completed.\n\n" 2
}

# FUNCTION FOR INSTALLING NODE + RELATED
# ###################################################################
install_node() {
	ech "- NVM..."
  if [ ! -d "$NVM_DIR" ]; then
    curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash &> /dev/null;
    export NVM_DIR="/home/rfrankel/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    nvm install node &> /dev/null 
    nvm use node &> /dev/null
    nvm alias default node &> /dev/null
    npm install -g --silent node-gyp &> /dev/null
  fi

}

# FUNCTION FOR COMMAND LINE 
# ###################################################################
install_cli() {
	ech "- Cloning z..."
  if [ ! -d ~/code/z ]; then
    git clone --quiet https://github.com/rupa/z.git ~/code/z &> /dev/null
  fi

  # INSTALL GIT LFS
  #ech "- Git LFS..."
  #if islinux; then
    #hash git-lfs >/dev/null 2>&1 || {
      #curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash &> /dev/null
      #sudo apt-get install git-lfs -y &>/dev/null 
    #}
  #fi

  # GITCONFIG SYMLINK
  rm -rf ~/.gitconfig
  ln -s ~/dotfiles/git/gitconfig ~/.gitconfig
}

# FUNCTION FOR UPDATING VIMRC
# ###################################################################
update_vimrc() {
	# Delete Existing
	ech "- Delete existing..."
	rm -rf ~/.vimrc
	rm -rf ~/.vim/snippets
  rm -rf ~/.vim/bundle/lightline.vim/autoload/lightline/colorscheme/frankelColorScheme.vim

	# Symlink New
	ech "- New symlinks..."
	ln -s ~/dotfiles/vimrc/vimrc ~/.vimrc
  if [ -d ~/dotfiles/vimrc/snippets ]; then
  	ln -s ~/dotfiles/vimrc/snippets ~/.vim/snippets 
  fi

	# Install Vundle if Needed
  if isosx; then
	  ech "- Install curl, vim, and vundle..."
    brew reinstall --quieter vim
  fi
	if [ ! -d ~/.vim/bundle/vundle/ ]; then
	 git clone --quiet https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle &> /dev/null
	fi

	# Create colors directory
	ech "- Create colors directory..."
	if [ ! -d ~/.vim/colors ]; then
	 mkdir ~/.vim/colors
	fi

	# Download VIM theme
	ech "- Downloading theme..."
	if [ ! -f ~/.vim/colors/wombat256mod.vim ]; then
	 curl --silent -L http://www.vim.org/scripts/download_script.php?src_id=13400 > ~/.vim/colors/wombat256mod.vim
	fi

	# Install bundles
	ech "- Install bundles..."
  vim +PluginInstall +qall
} #update_vimrc
