#!/bin/bash

# List of available scripts
options="check twitch stream\nSystem Actions\nCustom Command"

# Use dmenu to select a script
selection=$(echo -e "$options" | dmenu -i -p "Select a script:")

# Execute the chosen script
case "$selection" in
    "check twitch stream") $path_bash/checkTwitch.sh ;;  # The script you created earlier
    "System Actions") ./system_actions.sh ;;  # Another dmenu-based script
    "Custom Command") ./custom_command.sh ;;  # Any other script you want
esac

