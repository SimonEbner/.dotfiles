#!/bin/bash
function latest(){
    dir=$1
    num=$2
    if [ -z "$dir" ]; then dir="."; fi
    if [ -z "$num" ]; then num=5; fi
    find $dir -printf '%T+ %p\n' | sort -r | head -n $num
}
