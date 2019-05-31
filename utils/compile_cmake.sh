# FUNCTION FOR COMPILING CMAKE
# ###################################################################
function compile_cmake() {
  cd ~
  sudo apt-get install cmake

  # Get cmake version
  cmake_version=$(cmake --version | egrep -o "([0-9]{1,}\.)+[0-9]{1,}")

  if should_upgrade $cmake_version "2.8.11"; then
    # Upgrade cmake if necessary
    cd ~
    rm -rf cmake-2.8.12*
    wget -cL --no-check-certificate https://cmake.org/files/v2.8/cmake-2.8.12.tar.gz \
    && dtrx cmake-2.8.12.tar.gz \
    && cd cmake-2.8.12 \
    && mkdir _build \
    && cd _build \
    && cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    && make \
    && sudo make install \
    && sudo ldconfig
  fi
}
