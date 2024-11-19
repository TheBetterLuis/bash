#!/bin/bash


if [[ $1 -eq 2 ]]; then
  wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 150%-
  wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 100%+
  notify-send "Volume" "restored to 100%" -r 9045 -i ~/Pictures/icons/volume-restore-32.png
fi

if [[ $1 -eq 1 ]]; then
  wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 10%+
  notify-send "Volume" "increased by 10%" -r 9045 -i ~/Pictures/icons/volume-up-green-32.png
fi

if [[ $1 -eq 0 ]]; then
  wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 10%-
  notify-send "Volume" "decreased by 10%" -r 9045 -i ~/Pictures/icons/volume-down-red-32.png
fi


