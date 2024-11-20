#!/bin/bash

#common alerts go with 2222

if pgrep -x "flameshot" > /dev/null; then
  notify-send "Flameshot" "Flameshot is already runnning." -r 2222 -i ~/Pictures/icons/alert-white-32.png
else
  nohup flameshot gui >/dev/null 2>&1 &
fi


