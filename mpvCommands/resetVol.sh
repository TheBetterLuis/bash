#!/bin/bash

echo '{ "command": ["set_property", "volume", 80] }' | socat - /tmp/mpvsocket
filename=$(echo '{ "command": ["get_property", "filename"] }' | socat - /tmp/mpvsocket | jq -r '.data')
volume=$(echo '{ "command": ["get_property", "volume"] }' | socat - /tmp/mpvsocket | jq -r '.data')
formatted_volume=$(printf "%.0f" "$volume")

notify-send "MPV|Vol=$formatted_volume" "$filename" -t 1500 -r 1111 -i ~/Pictures/icons/next-white-32.png

