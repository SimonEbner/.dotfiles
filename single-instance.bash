#!/bin/zsh
export VIM_SINGLE=`which vim`
export SUPPORTS=`$VIM_SINGLE --version | grep "+clientserver"`
if [ "$SUPPORTS" != '' ];then
    alias vim="single-vim"
fi

if [ -z "$pid" ]; then
    export VIM_ID="VIM$RANDOM"
fi

function single-vim(){
    filename=$1
    filenameWithoutDouble=`echo $filename | sed -rn "s/(.*):$/\1/p"`
    if [ ! -f "$filename" ] && [ -f "$filenameWithoutDouble" ]; then
        filename=$filenameWithoutDouble
    fi

    `$VIM_SINGLE --serverlist | grep ${VIM_ID}$`
    if [ $? -eq 0 ]; then
        $VIM_SINGLE --servername $VIM_ID --remote-tab $filename
        $VIM_SINGLE --servername $VIM_ID --remote-send ':tabp<CR>:tabn<CR>'
        fg
    else
        `$VIM_SINGLE --serverlist | grep ${VIM_ID}1`
        if [ $? -eq 0 ]; then
            export VIM_ID=${VIM_ID}1
            $VIM_SINGLE --servername $VIM_ID --remote-tab $filename
            $VIM_SINGLE --servername $VIM_ID --remote-send ':tabp<CR>:tabn<CR>'
            fg
        else
            $VIM_SINGLE --servername $VIM_ID $filename
        fi
    fi
}
