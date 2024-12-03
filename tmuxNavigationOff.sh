#!/bin/bash
# Enable typing mode
tmux unbind-key -n h
tmux unbind-key -n j
tmux unbind-key -n k
tmux unbind-key -n l
tmux display-message "Typing mode activated"
notify-send "tmux" "Typing mode on" -r 9045 -i ~/Pictures/icons/tmux-32.png
