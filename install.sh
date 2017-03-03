# Source the utility functions
source ./utils/utils.sh
source ./utils/basic_setup.sh
source ./utils/install_bashrc.sh
source ./utils/basic_tools.sh
source ./utils/compile_vim.sh
source ./utils/compile_cmake.sh

# ###################################################################
# MAIN
# ###################################################################
function main() {
	clear
  define_colors
  banner

  ech "\nSetting Up..." 2
  ech "----------------------------------------------------------------------------" 2
  basic_setup

	ech "\nInstalling bash..." 2
  ech "----------------------------------------------------------------------------" 2
	install_bashrc

	ech "\nInstall completed.\n\n" 2
  ech "Please run 'source ~/.bashrc'\n\n" 2
}

# MAIN CLI Function
# ###################################################################
# At bottom so all functions are defined when this is run
if [ "$1" == "--help" ]; then
  echo "vim - compile vim and install all bundles"
  echo "cmake - install new version of cmake"
  echo "ycm - install youcompleteme"
  echo "tools - install basic tools"
  echo "all - INSTALL ALL THE ABOVE"
elif [ "$1" == "vim" ]; then
  compile_vim
  update_vimrc
elif [ "$1" == "cmake" ]; then
  compile_cmake
elif [ "$1" == "ycm" ]; then
  compile_ycm
elif [ "$1" == "tools" ]; then
  basic_tools
elif [ "$1" == "all" ]; then
  basic_tools
  compile_cmake
  compile_vim
  update_vimrc
  compile_ycm
else
  main
fi
