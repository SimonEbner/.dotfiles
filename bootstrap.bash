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

    for source in `find ~/.dotfiles -name \*.symlink | grep -vE "\.git"`; do
        dest="$HOME/.`basename \"${source%.*}\"`"
        destBackup="$dest.backup"

        if [ -h $dest ] && [ "`readlink -f $dest`" == "$source" ]; then
            echo "Symlink already setup for $dest"
            continue
        fi
        if [ -f $dest ] || [ -d $dest ] || [ -h $dest ]; then
            if [ -h $destBackup ]; then
                loc=`readlink -f $destBackup`
                echo "Removing symlink $destBackup that pointed to $loc"
                rm $destBackup;
            elif [ -f $destBackup ] || [ -d $destBackup ]; then
                msg="Backup $destBackup exists already. Skip link? "
                read -p "$msg" -n 1 -r
                if [[ $REPLY =~ ^[Yy]$ ]]; then
                    continue
                else
                    echo "Stopping."
                    exit 1
                fi
            fi
            printf "Backup of existing file \n"
            mv $dest $destBackup
        fi
        ln -s $source $dest
        printf "Installed $dest \n"
    done
}

link_files
