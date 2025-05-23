#!/bin/bash

# Prompt the user for input using dmenu
TAG_INPUT=$(echo | dmenu -p "Enter tag:")

# Check if input is empty
if [ -n "$TAG_INPUT" ]; then
    # Type ":tag whatiwrote" into the active window
    xdotool type ":tag $TAG_INPUT"
    xdotool key Return  # Press Enter after typing
    xdotool key Return  # Press Enter after typing
fi

