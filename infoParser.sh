#!/bin/bash

# Run cmus-remote -Q and store the output in a variable
cmus_output=$(cmus-remote -Q)

# Extract information using grep and awk
status=$(echo "$cmus_output" | grep 'status' | awk '{print $2}')
file=$(echo "$cmus_output" | grep 'file' | awk '{print $2}')
artist=$(echo "$cmus_output" | grep 'tag artist' | cut -d ' ' -f 3-)
title=$(echo "$cmus_output" | grep 'tag title' | cut -d ' ' -f 3-)
album=$(echo "$cmus_output" | grep 'tag album' | cut -d ' ' -f 3-)
vol_left=$(echo "$cmus_output" | grep 'set vol_left' | awk '{print $3}')
vol_right=$(echo "$cmus_output" | grep 'set vol_right' | awk '{print $3}')

# Create directory if it doesn't exist
mkdir -p ~/cmus_info

# Write each variable to its own file
echo "$status" > ~/cmus_info/status.txt
echo "$file" > ~/cmus_info/file.txt
echo "$artist" > ~/cmus_info/artist.txt
echo "$title" > ~/cmus_info/title.txt
echo "$album" > ~/cmus_info/album.txt
echo "$vol_left" > ~/cmus_info/vol_left.txt
echo "$vol_right" > ~/cmus_info/vol_right.txt

