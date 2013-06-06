#!/bin/bash
# mostly adapted from https://github.com/holman/dotfiles


link_files () {
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    if [ $DIR != "$HOME/.dotfiles" ]; then
        echo "You need to clone this repo into $HOME/.dotfiles"
        exit 1
    fi

    cd $DIR
    git submodule init; git submodule update;
    git submodule foreach "git checkout master; git pull; ./init.bash"

    for source in `find ~/.dotfiles -name \*.symlink`; do
        dest="$HOME/.`basename \"${source%.*}\"`"

        if [ -f $dest ] || [ -d $dest ] || [ -h $dest ]; then
            printf "Backup of existing file \n"
            mv $dest $dest\.backup
        fi
        if [ -d $source ]; then
            ln -s $source/ $dest
        else
            ln -s $source $dest
        fi
        printf "Installed $dest \n"
    done
}

link_files
