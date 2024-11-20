#!/bin/bash

#common alerts go with 2222

pgrep -x "cmus" > /dev/null || nohup cmus >/dev/null 2>&1 &
notify-send "cmus" "cmus is already runnning." -r 2222 -i ~/Pictures/icons/alert-white-32.png


