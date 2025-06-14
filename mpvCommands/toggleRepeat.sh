#!/bin/bash

repeat=$(echo '{ "command": ["get_property", "loop-file"] }' | socat - /tmp/mpvsocket | jq -r '.data')
filename=$(echo '{ "command": ["get_property", "filename"] }' | socat - /tmp/mpvsocket | jq -r '.data')
paused=$(echo '{ "command": ["get_property", "pause"] }' | socat - /tmp/mpvsocket | jq -r '.data')

if [ "$repeat" == "inf" ]; then
    status_message=""
    echo '{ "command": ["set_property", "loop-file", "no"] }' | socat - /tmp/mpvsocket
    icon=~/Pictures/icons/repeat-white-32.png
else
    status_message="Recu"
    echo '{ "command": ["set_property", "loop-file", "yes"] }' | socat - /tmp/mpvsocket
    icon=~/Pictures/icons/repeat-one-white-32.png
fi

if [ "$paused" == "true" ]; then
    playing="Paused"
else
    playing="Playing"
fi

notify-send "MPV|$playing|$status_message" "$filename" -t 1500 -r 1111 -i $icon


