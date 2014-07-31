function searchpdf(){
    local first="$1"
    local second="$2"

    local p='.'
    local string=''
    local ignoreCase=''
    if [ "$1" = "-i" ]; then
        ignoreCase='-i'
        first="$2"
        second="$3"
    fi
    if [ -z "$second" ]; then
        string="$first";
    else
        p="$first";
        string="$second";
    fi
    cmd='pdftotext "{}" - | grep '"$ignoreCase"' --with-filename --label="{}" --color '"\"$string\""
    find $p -name '*.pdf' -exec bash -c "$cmd" \;
}
