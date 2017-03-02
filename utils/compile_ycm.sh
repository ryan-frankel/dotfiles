# FUNCTION FOR COMPILING YOUCOMPLETEME
# ###################################################################
function compile_ycm() {
  cd ~

  # Requirements
  sudo apt-get install build-essential
  sudo apt-get install python-dev python3-dev
  sudo add-apt-repository ppa:ubuntu-toolchain-r/test
  sudo apt-get update
  sudo apt-get install gcc-4.8 g++-4.8
  sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 60 --slave /usr/bin/g++ g++ /usr/bin/g++-4.8

  # Install node
  install_node

  # Install go
  #sudo apt-get install golang-go

  # Compile YCM
  cd ~/.vim/bundle/YouCompleteMe
  ./install.py --tern-completer 
}
