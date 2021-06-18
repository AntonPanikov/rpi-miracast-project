#!/bin/bash

log_file="/var/tmp/picast.log"
tear_down_message="INFO ---- Teardown completed ----"


last_line=`tail -n 1 $log_file`

if [ "$last_line" == "$tear_down_message" ]; then

    if [ `stat --format=%Y $log_file` -le $(( `date +%s` - 15 )) ]; then 
        sudo poweroff
    fi

fi
