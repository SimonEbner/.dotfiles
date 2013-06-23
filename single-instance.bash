#!/bin/zsh
export VIM_SINGLE=`which vim`
export SUPPORTS=`$VIM_SINGLE --version | grep "+clientserver"`
if [ "$SUPPORTS" != '' ];then
    alias vim="single-vim"
fi

function single-vim(){
    filename=$1
    filenameWithoutDouble=`echo $filename | sed -rn "s/(.*):$/\1/p"`
    if [ ! -f "$filename" ] && [ -f "$filenameWithoutDouble" ]; then
        filename=$filenameWithoutDouble
    fi
    pid=`ps ax | grep -v grep | grep vim$$` 
    if [ -z "$pid" ]; then
        $VIM_SINGLE --servername vim$$ $filename
    else
        $VIM_SINGLE --servername vim$$ --remote-tab $filename
        $VIM_SINGLE --servername vim$$ --remote-send ':tabp<CR>:tabn<CR>'
        fg
    fi
}
