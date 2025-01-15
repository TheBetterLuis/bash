#!/bin/bash

notify-send "Current Source(mic)" "$(pactl get-default-source)" -r 2222 -i ~/Pictures/icons/alert-white-32.png
