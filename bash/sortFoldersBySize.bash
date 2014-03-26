#!/bin/bash
function sortFoldersBySize(){
    dir=$1
    if [ -z "$dir" ]; then dir="."; fi
    du --max-depth=1 $dir 2>/dev/null | sort -n -r
}
