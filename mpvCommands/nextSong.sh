#!/bin/bash

echo '{ "command": ["playlist-next"] }' | socat - /tmp/mpvsocket
repeat=$(echo '{ "command": ["get_property", "loop-file"] }' | socat - /tmp/mpvsocket | jq -r '.data')
filename=$(echo '{ "command": ["get_property", "filename"] }' | socat - /tmp/mpvsocket | jq -r '.data')
paused=$(echo '{ "command": ["get_property", "pause"] }' | socat - /tmp/mpvsocket | jq -r '.data')

if [ "$repeat" == "inf" ]; then
    repeatStatus="Recu"
else
    repeatStatus=""
fi

if [ "$paused" == "true" ]; then
    status_message="Paused"
else
    status_message="Playing"
fi
notify-send "MPV|$status_message|$repeatStatus" "$filename" -t 1500 -r 1111 -i ~/Pictures/icons/next-white-32.png


