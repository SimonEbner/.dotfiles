#!/bin/bash
# mostly adapted from https://github.com/holman/dotfiles


link_files () {
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    for source in `find $DIR -name \*.symlink`; do
        dest="$HOME/.`basename \"${source%.*}\"`"

        if [ -f $dest ] || [ -d $dest ]; then
            printf "Backup of existing file \n"
            mv $dest $dest\.backup
        fi
        ln -s $source $dest
        printf "Installed $dest \n"
    done
}

link_files
