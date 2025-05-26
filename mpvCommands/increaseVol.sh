#!/bin/bash

# Get the filename from MPV's IPC response
# response=$(echo '{ "command": ["get_property", "filename"] }' | socat - /tmp/mpvsocket)
echo '{ "command": ["add", "volume", 10] }' | socat - /tmp/mpvsocket
# Extract the filename
# filename=$(echo "$response" | jq -r '.data')
filename=$(echo '{ "command": ["get_property", "filename"] }' | socat - /tmp/mpvsocket | jq -r '.data')
volume=$(echo '{ "command": ["get_property", "volume"] }' | socat - /tmp/mpvsocket | jq -r '.data')
formatted_volume=$(printf "%.0f" "$volume")

# Send a notification
# notify-send "cmus - volume=$vol_left%" "$status - $kontinue$repeat$shuffle $repeat_current\n$title - $artist "
#
notify-send "MPV|Vol=$formatted_volume" "$filename" -t 1500 -r 1111 -i ~/Pictures/icons/next-white-32.png

