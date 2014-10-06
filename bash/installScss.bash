#!/bin/bash
function installScss(){
    sudo apt-get install ruby-full build-essential ruby-dev
    sudo apt-get install rubygems 
    sudo gem install  listen
    sudo gem install sass
    sudo gem install --version '~> 0.9' rb-inotify
}
