function mk(){
    set -o pipefail
    exec 5>&1
    FF=$(make 2>&1|tee >(cat - >&5))
    code=$?
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
    if [[ $code == 0 ]]; then
        echo "NO ERROR"
    fi
    ( echo $FF | GREP_COLOR='01;31' egrep --color=always '^([a-zA-Z0-9/._\-]+\.(cpp|h))|$' | GREP_COLOR='01;36' egrep --color=always 'error:(.*)')
    ( echo $FF | GREP_COLOR='01;31' egrep --color=always '^([a-zA-Z0-9/._\-]+\.(cpp|h))|$' | GREP_COLOR='01;36' egrep --color=always 'undefined reference(.*)')
    return $code
}
