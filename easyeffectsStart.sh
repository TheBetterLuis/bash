#!/bin/sh

if ! pgrep -x "easyeffects" > /dev/null; then
  xdotool key Alt+8
  sleep 0.1  # Adjust sleep time as needed
  xdotool key Alt+p
  sleep 0.1
  xdotool type "easyeffects"
  sleep 0.1
  xdotool key Return
  sleep 2.0
  xdotool key Alt+1 
else
  notify-send "easyeffects" "easyeffects is already runnning." -r 2222 -i ~/Pictures/icons/alert-white-32.png
fi
