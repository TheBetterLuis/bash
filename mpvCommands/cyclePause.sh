#!/bin/bash

echo '{ "command": ["cycle", "pause"] }' | socat - /tmp/mpvsocket
filename=$(echo '{ "command": ["get_property", "filename"] }' | socat - /tmp/mpvsocket | jq -r '.data')
paused=$(echo '{ "command": ["get_property", "pause"] }' | socat - /tmp/mpvsocket | jq -r '.data')

if [ "$paused" == "true" ]; then
    status_message="Paused"
    icon=~/Pictures/icons/pause-white-32.png
else
    status_message="Playing"
    icon=~/Pictures/icons/play-white-32.png
fi
notify-send "MPV|$status_message" "$filename" -t 1500 -r 1111 -i $icon

