#!/bin/bash
function sortFoldersBySize(){
    dir=$1
    if [ -z "$dir" ]; then dir="."; fi
    du --max-depth=0 -k $dir/* | sort -nr | awk '{ if($1>=1024*1024) {size=$1/1024/1024; unit="G"} else if($1>=1024) {size=$1/1024; unit="M"} else {size=$1; unit="K"}; if(size<10) format="%.1f%s"; else format="%.0f%s"; res=sprintf(format,size,unit); printf "%-8s %s\n",res,$2 }'
}
