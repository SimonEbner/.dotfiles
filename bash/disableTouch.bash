#!/bin/bash
ids=`xinput list | sed  -r '/.*ouch/!d;s/.*ouch.*id=([0-9]+).*/\1/g'`
for id in $ids; do
    xinput set-prop $id "Device Enabled" 0
done
