#!/bin/bash

captureCardSink=$(wpctl status | grep "2109 Analog Stereo" | awk '{print $2}' | cut -d'.' -f1)

if [[ $1 -eq 3 ]]; then
  nohup wpctl set-volume -l 1.5 $captureCardSink 150% >/dev/null 2>&1 &
  sleep 0.2
  notify-send "CC $(wpctl get-volume $captureCardSink)" "set to 150%(captured card)" -r 9045 -i ~/Pictures/icons/volume-restore-32.png
fi


if [[ $1 -eq 2 ]]; then
  nohup wpctl set-volume -l 1.5 $captureCardSink 100% >/dev/null 2>&1 &
  sleep 0.2
  notify-send "CC $(wpctl get-volume $captureCardSink)" "restored to 100%(captured card)" -r 9045 -i ~/Pictures/icons/volume-restore-32.png
fi

if [[ $1 -eq 1 ]]; then
  nohup wpctl set-volume -l 1.5 $captureCardSink 10%+ >/dev/null 2>&1 &
  sleep 0.2
  notify-send "CC $(wpctl get-volume $captureCardSink)" "increased by 10%(captured card)" -r 9045 -i ~/Pictures/icons/volume-up-green-32.png
fi

if [[ $1 -eq 0 ]]; then
  nohup wpctl set-volume -l 1.5 $captureCardSink 10%- >/dev/null 2>&1 &
  sleep 0.2
  notify-send "CC $(wpctl get-volume $captureCardSink)" "decreased by 10%(captured card)" -r 9045 -i ~/Pictures/icons/volume-down-red-32.png
fi


