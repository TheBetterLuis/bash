#!/bin/bash


if [[ $1 -eq 2 ]]; then
  nohup wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 100% >/dev/null 2>&1 &
  sleep 0.2
  notify-send "$(wpctl get-volume @DEFAULT_AUDIO_SINK@)" "restored to 100%" -r 9045 -i ~/Pictures/icons/volume-restore-32.png
fi

if [[ $1 -eq 1 ]]; then
  nohup wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 10%+ >/dev/null 2>&1 &
  sleep 0.2
  notify-send "$(wpctl get-volume @DEFAULT_AUDIO_SINK@)" "increased by 10%" -r 9045 -i ~/Pictures/icons/volume-up-green-32.png
fi

if [[ $1 -eq 0 ]]; then
  nohup wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 10%- >/dev/null 2>&1 &
  sleep 0.2
  notify-send "$(wpctl get-volume @DEFAULT_AUDIO_SINK@)" "decreased by 10%" -r 9045 -i ~/Pictures/icons/volume-down-red-32.png
fi


