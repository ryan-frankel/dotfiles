# FUNCTION FOR COMPILING YOUCOMPLETEME
# ###################################################################
function compile_ycm() {
  cd ~

  # Requirements
  sudo apt install build-essential python-dev python3-dev gcc g++ -y 

  # Install node
  install_node

  # Compile YCM
  cd ~/.vim/bundle/YouCompleteMe
  ./install.py --tern-completer 
}
