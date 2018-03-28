# FUNCTION FOR INSTALLING BASH
# ###################################################################
function install_bashrc() {
	#DELETE EXISTING .bashrc IF THERE IS ONE
	ech "- Delete existing..."
	rm -rf ~/.bashrc &> /dev/null
	rm -rf ~/.bash_profile &> /dev/null
  rm -rf ~/.inputrc &> /dev/null
  rm -rf ~/.tmux.conf &> /dev/null

	#SYM LINK NEW .bashrc FILE
	ech "- Create new symlinks..."
	ln -s ~/dotfiles/bashrc/bashrc.sh ~/.bashrc
	ln -s ~/dotfiles/bashrc/bashrc.sh ~/.bash_profile
  ln -s ~/dotfiles/bashrc/inputrc.sh ~/.inputrc
  ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

	#RELOAD .bashrc
  #ech "- Reload bashrc..."
  #source ~/.bashrc
}

