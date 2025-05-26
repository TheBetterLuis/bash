#!/bin/bash

filename=$(echo '{ "command": ["get_property", "filename"] }' | socat - /tmp/mpvsocket | jq -r '.data')
repeat=$(echo '{ "command": ["get_property", "loop-file"] }' | socat - /tmp/mpvsocket | jq -r '.data')

if [ "$repeat" == "inf" ]; then
    status_message="Once"
    echo '{ "command": ["set_property", "loop-file", "no"] }' | socat - /tmp/mpvsocket
    icon=~/Pictures/icons/repeat-white-32.png
else
    status_message="Infinite"
    echo '{ "command": ["set_property", "loop-file", "yes"] }' | socat - /tmp/mpvsocket
    icon=~/Pictures/icons/repeat-one-white-32.png
fi
notify-send "MPV|$status_message" "$filename" -t 1500 -r 1111 -i $icon


