#!/bin/bash
function killAllRos(){
    for i in `ps ax | grep ros | sed -rn "s/([0-9]+).*/\1/p"`; do kill $i; done
}
