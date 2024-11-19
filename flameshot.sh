#!/bin/bash

#common alerts go with 2222

# Check if Telegram is already running
if pgrep -x "flameshot" > /dev/null; then
  notify-send "Flameshot" "Flameshot is already runnning." -r 2222 -i ~/Pictures/icons/alert-white-32.png
else
  # Run Telegram with output suppressed and in the background
  nohup flameshot gui >/dev/null 2>&1 &
fi


