function buildYCM(){
    rm -rf ~/ycm_build
    mkdir -p ~/ycm_build
    cd ~/.vim/bundle/YouCompleteMe/
    git submodule update --init --recursive
    ./install.sh
    cd ~/ycm_build
    cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
    make ycm_support_libs
}
