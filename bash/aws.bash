#!/bin/bash
if [ -f ~/.aws ]; then
    source ~/.aws
fi
complete -C aws_completer aws
