#!/bin/zsh
export VIM_SINGLE=`which vim`
export SUPPORTS=`vim --version | grep "+clientserver"`
if [ $SUPPPORTS ];then
    alias vim="single-vim"
fi

function single-vim(){
echo $VIM_SINGLE
    pid=`ps ax | grep -v grep | grep vim$$` 
    if [ -z $pid ]; then
        $VIM_SINGLE --servername vim$$ $@
    else
        $VIM_SINGLE --servername vim$$ --remote-tab $1
        $VIM_SINGLE --servername vim$$ --remote-send ':tabp<CR>:tabn<CR>'
        fg
    fi
}
