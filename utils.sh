#!/bin/bash

# List of available scripts
options="filter\nxrandr\norange\nescape\nremove-filter"

# Use dmenu to select a script
selection=$(echo -e "$options" | dmenu -i -p "Select a script:")

# Execute the chosen script
case "$selection" in
     # add filter to screen
    "filter") redshift -O 4000k & ;;  
    # do monitor config
    "xrandr") xrandr --output HDMI-0 --primary --mode 1920x1080 --brightness 0.8 --pos 0x768 --rotate normal --output DP-0 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --mode 1366x768 --brightness 0.6 --pos 244x0 --rotate normal ;;  
    # open orange picture to use as a night ligth 
    "orange") setsid -f feh ~/Pictures/orange.png ;;  
    # open orange picture to use as a night ligth 
    "escape") setxkbmap -option caps:escape;;  
    #remove filter
    "remove-filter") redshift -x ;;  
esac

