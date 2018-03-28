# FUNCTION FOR COMPILING YOUCOMPLETEME
# ###################################################################
function compile_ycm() {
  cd ~

  # Requirements
  sudo apt-get install build-essential
  sudo apt-get install python-dev python3-dev
  sudo add-apt-repository ppa:ubuntu-toolchain-r/test
  sudo apt-get update
  sudo apt-get install gcc-6 g++-6
  sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 60 --slave /usr/bin/g++ g++ /usr/bin/g++-6

  # Install node
  install_node

  # Install go
  #sudo apt-get install golang-go

  # Compile YCM
  cd ~/.vim/bundle/YouCompleteMe
  CXX="/usr/bin/g++-6" CC="/usr/bin/gcc-6" ./install.py --tern-completer 
}
