# FUNCTION FOR COMPILING VIM FROM SOURCE
# ###################################################################
function compile_vim() {
	# Get cmake version

	vim_version=$(vim --version | egrep -o "([0-9]{1,}\.)+[0-9]{1,}" | head -n1)
	hash vim >/dev/null 2>&1 || { vim_version="0"; }

	if should_upgrade $vim_version "8.0"; then 
	
		# Install prereqs
		sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
				libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
				libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
				python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git

		# Remove vim
		sudo apt-get remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common vim-nox
		sudo dpkg -r vim

		  # Get vim source
			cd ~
			sudo rm -rf ~/vim
			git clone https://github.com/vim/vim.git ./vim
		  cd vim
		  
		  # Configure installation
		  ./configure --with-features=huge \
			    --enable-multibyte \
			    --enable-rubyinterp=yes \
			    --enable-pythoninterp=yes \
			    --enable-python3interp=yes \
			    --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
			    --enable-perlinterp=yes \
			    --enable-luainterp=yes \
			    --enable-gui=gtk2 --enable-cscope --prefix=/usr
		  make VIMRUNTIMEDIR=/usr/share/vim/vim80

		  # Get checkinstall
		  sudo apt-get install checkinstall

		  # Install vim
		  cd ~/vim
		  sudo checkinstall

		  # Set Vim as default editor
		  sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
		  sudo update-alternatives --set editor /usr/bin/vim
		  sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
		  sudo update-alternatives --set vi /usr/bin/dbus-update-activation-environment
	fi
}
