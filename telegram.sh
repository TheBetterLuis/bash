#!/bin/bash

#common alerts go with 2222

# Check if Telegram is already running
if pgrep -x "Telegram" > /dev/null; then
  notify-send "Telegram" "Telegram is already runnning." -r 2222 -i ~/Pictures/icons/alert-white-32.png
else
  # Run Telegram with output suppressed and in the background
  nohup ~/Downloads/Telegram/Telegram >/dev/null 2>&1 &
fi

#nohup  ~/Downloads/Telegram/Telegram >/dev/null &
