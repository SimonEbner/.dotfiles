#!/bin/bash

function notpushed(){
    branch=`git branch | sed -nr 's/\*\s*(.*)/\1/p'`
    git log origin/$branch..$branch
}
