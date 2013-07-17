#!/bin/bash
function installNode(){
    mkdir ~/local
    mkdir ~/node-latest-install
    cd ~/node-latest-install
    curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1
    ./configure --prefix=~/local
    make install # ok, fine, this step probably takes more than 30 seconds...
    curl https://npmjs.org/install.sh | sh
    rm -rf ~/node-latest-install
    source ~/.bashrc
}
