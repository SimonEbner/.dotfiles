#!/bin/bash
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias trash='gvfs-trash'
alias run='gvfs-open'

alias copy='xclip -selection clipboard'
alias git-lastchanges='for k in `git branch | sed s/^..//`; do echo -e `git log -1 --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k --`\\t"$k";done | sort'

# colored make
alias mc="(make 2>&1 | GREP_COLOR='01;31' egrep --color=always '^([a-zA-Z0-9/._\-]+\.(cpp|h))|$' | GREP_COLOR='01;36' egrep --color=always 'error:(.*)|$')"
