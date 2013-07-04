#!/bin/bash
export PATH=/opt/TurboVNC/bin:$PATH

if [ -d "$HOME/local/bin" ]; then
    export PATH=$HOME/local/bin:$PATH
fi
