#!/bin/zsh
export VIM_SINGLE=`which vim`
alias vim="single-vim"

function single-vim(){
echo $VIM_SINGLE
    pid=`ps ax | grep -v grep | grep vim$$` 
    if [ -z $pid ]; then
        $VIM_SINGLE --servername vim$$ $@
    else
        $VIM_SINGLE --servername vim$$ --remote-tab $1
        fg
    fi
}
