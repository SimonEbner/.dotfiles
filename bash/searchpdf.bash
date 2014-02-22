function searchpdf(){
    first="$1"
    second="$2"

    path='.'
    string=''
    ignoreCase=''
    if [ "$1" = "-i" ]; then
        ignoreCase='-i'
        first="$2"
        second="$3"
    fi
    if [ -z "$second" ]; then
        string="$first";
    else
        path="$first";
        string="$second";
    fi
    cmd='pdftotext "{}" - | grep '"$ignoreCase"' --with-filename --label="{}" --color '"\"$string\""
    find $path -name '*.pdf' -exec bash -c "$cmd" \;
}
