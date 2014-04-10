#!/bin/zsh
export VIM_SINGLE=`which vim`
export SUPPORTS=`$VIM_SINGLE --version | grep "+clientserver"`
if [ "$SUPPORTS" != '' ];then
    alias vim="single-vim"
fi

export VIM_ID="VIM$RANDOM"

function single-vim(){
    filename=$1
    filenameWithoutDouble=`echo $filename | sed -rn "s/(.*):$/\1/p"`
    if [ ! -f "$filename" ] && [ -f "$filenameWithoutDouble" ]; then
        filename=$filenameWithoutDouble
    fi
    pid=`$VIM_SINGLE --serverlist | grep $VIM_ID`
    if [ -z "$pid" ]; then
        $VIM_SINGLE --servername $VIM_ID $filename
    else
        $VIM_SINGLE --servername $VIM_ID --remote-tab $filename
        $VIM_SINGLE --servername $VIM_ID --remote-send ':tabp<CR>:tabn<CR>'
        fg
    fi
}
