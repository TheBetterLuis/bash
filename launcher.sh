#!/bin/bash

# List of available scripts
options="mpv-twitch\nonline-streamer-twitch\nchat-twitch\nutils\nedit-config"

# Use dmenu to select a script
selection=$(echo -e "$options" | dmenu -i -p "Select a script:")

# Execute the chosen script
case "$selection" in
# open mpv with stream
    "mpv-twitch") $path_bash/mpvTwitch.sh ;;  
    # check if streamer is live
    "online-streamer-twitch") $path_bash/checkTwitch.sh ;;  
    # chatterino twitch 
    "chat-twitch") $path_bash/chatterino.sh ;;  
    #utilities
    "utils") $path_bash/utils.sh ;;  
    #edit configs
    "edit-config") $path_bash/editConfig.sh ;;  

esac

