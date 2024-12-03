#!/bin/bash
# Enable navigation mode
tmux bind-key -n h select-pane -L
tmux bind-key -n j select-pane -D
tmux bind-key -n k select-pane -U
tmux bind-key -n l select-pane -R
tmux display-message "Navigation mode activated"
notify-send "tmux" "Navigation mode on" -r 9045 -i ~/Pictures/icons/tmux-32.png


