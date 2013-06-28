#!/bin/bash
function assertInstalled(){
    prog=$1
    pkg=$2
    if [ -z "$pkg" ]; then pkg=$prog; fi
    type $prog > /dev/null 2>&1 || sudo apt-get install -y $pkg
}
function setupEnv(){
    assertInstalled terminator
    assertInstalled gsettings dconf-tools
    gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/terminator
    
    assertInstalled thunderbird
    assertInstalled chromium-browser
    assertInstalled wmctrl
    assertInstalled keepassx

    if [ -z "`ls /etc/apt/sources.list.d | grep git-core-ppa`" ]; then
        sudo apt-add-repository ppa:git-core/ppa
        sudo apt-get update
    fi
    assertInstalled git-core
    assertInstalled gitg
    assertInstalled gitk
    assertInstalled htop
    assertInstalled aptitude
    assertInstalled unrar
    assertInstalled ia32-libs
    assertInstalled filezilla
    assertInstalled nemo
    assertInstalled xclip
    assertInstalled exuberant-ctags
}
