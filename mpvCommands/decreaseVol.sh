#!/bin/bash

# Get the filename from MPV's IPC response
# response=$(echo '{ "command": ["get_property", "filename"] }' | socat - /tmp/mpvsocket)
echo '{ "command": ["add", "volume", -10] }' | socat - /tmp/mpvsocket
# Extract the filename
# filename=$(echo "$response" | jq -r '.data')
repeat=$(echo '{ "command": ["get_property", "loop-file"] }' | socat - /tmp/mpvsocket | jq -r '.data')
filename=$(echo '{ "command": ["get_property", "filename"] }' | socat - /tmp/mpvsocket | jq -r '.data')
volume=$(echo '{ "command": ["get_property", "volume"] }' | socat - /tmp/mpvsocket | jq -r '.data')
formatted_volume=$(printf "%.0f" "$volume")

if [ "$repeat" == "inf" ]; then
    repeatStatus="Recu"
else
    repeatStatus=""
fi

notify-send "MPV|Vol=$formatted_volume|$repeatStatus" "$filename" -t 1500 -r 1111 -i ~/Pictures/icons/volume-down-red-32.png

