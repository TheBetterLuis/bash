#!/bin/bash

echo '{ "command": ["playlist-next"] }' | socat - /tmp/mpvsocket
filename=$(echo '{ "command": ["get_property", "filename"] }' | socat - /tmp/mpvsocket | jq -r '.data')
paused=$(echo '{ "command": ["get_property", "pause"] }' | socat - /tmp/mpvsocket | jq -r '.data')

if [ "$paused" == "true" ]; then
    status_message="Paused"
else
    status_message="Playing"
fi
notify-send "MPV|$status_message" "$filename" -t 1500 -r 1111 -i ~/Pictures/icons/next-white-32.png


