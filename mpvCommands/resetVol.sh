#!/bin/bash

echo '{ "command": ["set_property", "volume", 80] }' | socat - /tmp/mpvsocket
repeat=$(echo '{ "command": ["get_property", "loop-file"] }' | socat - /tmp/mpvsocket | jq -r '.data')
filename=$(echo '{ "command": ["get_property", "filename"] }' | socat - /tmp/mpvsocket | jq -r '.data')
volume=$(echo '{ "command": ["get_property", "volume"] }' | socat - /tmp/mpvsocket | jq -r '.data')
formatted_volume=$(printf "%.0f" "$volume")

if [ "$repeat" == "inf" ]; then
    repeatStatus="Recu"
else
    repeatStatus=""
fi

notify-send "MPV|Vol=$formatted_volume|$repeatStatus" "$filename" -t 1500 -r 1111 -i ~/Pictures/icons/volume-restore-32.png

