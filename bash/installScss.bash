#!/bin/bash
function installScss(){
    sudo apt-get install ruby-full build-essential rubygems
    sudo gem install sass
    sudo gem install --version '~> 0.9' rb-inotify
}
