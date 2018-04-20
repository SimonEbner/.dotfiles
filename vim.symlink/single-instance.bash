#!/bin/zsh
export VIM_SINGLE=`which vim`
$VIM_SINGLE --version | grep "+clientserver" > /dev/null
export SUPPORTS=$?
if [ "$SUPPORTS" = '0' ];then
    alias vim="single-vim"
fi

export VIM_ID="VIM$RANDOM"

function single-vim(){
    filename=$1
    filenameWithoutDouble=`echo $filename | sed -rn "s/(.*):$/\1/p"`
    if [ ! -f "$filename" ] && [ -f "$filenameWithoutDouble" ]; then
        filename=$filenameWithoutDouble
    fi

    $VIM_SINGLE --serverlist | grep ${VIM_ID}$
    if [ $? -eq 0 ]; then
        $VIM_SINGLE --servername $VIM_ID --remote-tab $filename
        $VIM_SINGLE --servername $VIM_ID --remote-send ':tabp<CR>:tabn<CR>'
        fg
    else
        $VIM_SINGLE --serverlist | grep ${VIM_ID}
        if [ $? -eq 0 ]; then
            export VIM_ID=${VIM_ID}1
            echo "$VIM_SINGLE --servername $VIM_ID --remote-tab $filename"
            $VIM_SINGLE --servername $VIM_ID --remote-send ':tabp<CR>:tabn<CR>'
            fg
        else
            (bash -c "sleep .2 && $VIM_SINGLE --servername $VIM_ID --remote-send ':set autochdir<CR>'" &)
            $VIM_SINGLE --servername $VIM_ID $filename
        fi
    fi
}
