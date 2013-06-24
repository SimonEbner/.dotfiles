#!/bin/bash
function installJava7(){
    if [ -z "`ls /etc/apt/sources.list.d | grep webupd8team-java`" ]; then
        sudo apt-add-repository ppa:webupd8team/java
        sudo apt-get update
    fi
    sudo apt-get install -y oracle-java7-installer
}
