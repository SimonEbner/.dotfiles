#!/bin/bash

export PATH=~/dev/kubernetes/cluster:$PATH

if [ -d "$HOME/local/bin" ]; then
    export PATH=$HOME/local/bin:$PATH
fi
