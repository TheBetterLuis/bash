#!/bin/bash

#this one is not working when launched from dmenu, launch from terminal

# Define the file where the URLs will be stored
URL_FILE=~/.newsboat/urls

# Prompt user for the Twitch username using dmenu
USERNAME=$(echo "" | dmenu -p "Enter Twitch username:")

# Ensure the input is not empty
if [ -n "$USERNAME" ]; then
    # Construct the new line
    NEW_LINE="https://openrss.org/www.twitch.tv/$USERNAME/videos?filter=all&sort=time twitch vods $USERNAME"

    # Append to the file
    echo -e "$NEW_LINE\nhttps://www.twitch.tv/$USERNAME twitch live $USERNAME" >> "$URL_FILE"

    # Show confirmation message
    notify-send "Added to $URL_FILE" "$NEW_LINE"
else
    notify-send "No input provided" "Operation canceled."
fi

