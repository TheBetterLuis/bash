#!/bin/bash

if pidof -x "cmus" > /dev/null; then
  #will only show status if it's already open
  $path_bash/cmusvol.sh 7
else
  sleep 0.1
  xdotool key alt+8 
  sleep 0.1
  xdotool key alt+shift+Enter
  sleep 0.4
  xdotool type cmus
  xdotool key Enter
  xdotool key alt+1 
fi
