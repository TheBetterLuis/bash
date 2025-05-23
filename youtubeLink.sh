#!/bin/bash

# Prompt the user for input using dmenu
TAG_INPUT=$(xclip -o -selection clipboard)
# TAG_INPUT=$(echo | dmenu -p "Enter youtube video link:")

# Check if input is empty
if [ -n "$TAG_INPUT" ]; then
    # Type ":tag whatiwrote" into the active window
    setsid -f mpv  $TAG_INPUT >/dev/null 2>&1
fi

