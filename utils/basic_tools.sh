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
  ech "- n (for Node)..."
  if [ ! -d "$N_PREFIX"  ]; then
    curl -L https://git.io/n-install | bash
  fi
}

# FUNCTION FOR COMMAND LINE 
# ###################################################################
install_cli() {
	ech "- Cloning z..."
  if [ ! -d ~/code/z ]; then
    mkdir ~/code
    git clone --quiet https://github.com/rupa/z.git ~/code/z &> /dev/null
  fi

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
  rm -rf ~/.vim/UltiSnips

	# Symlink New
	ech "- New symlinks..."
	ln -s ~/dotfiles/vimrc/vimrc ~/.vimrc
  if [ -d ~/dotfiles/vimrc/snippets ]; then
  	ln -s ~/dotfiles/vimrc/snippets ~/.vim/snippets 
  fi
  if [ -d ~/dotfiles/vimrc/UltiSnips ]; then 
    ln -s ~/dotfiles/vimrc/UltiSnips ~/.vim/UltiSnips
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
  if [ ! -d ~/.vim/colors/ ]; then
    mkdir ~/.vim/colors/
  fi
  rm ~/.vim/color/wombat256mod.vim
  cp ~/dotfiles/vimrc/colors/wombat256mod.vim ~/.vim/colors/wombat256mod.vim

	# Install bundles
	ech "- Install bundles..."
  vim +PluginInstall +qall
} #update_vimrc
