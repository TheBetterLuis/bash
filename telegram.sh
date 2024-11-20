#!/bin/bash

#common alerts go with 2222

if pgrep -x "Telegram" > /dev/null; then
  notify-send "Telegram" "Telegram is already runnning." -r 2222 -i ~/Pictures/icons/alert-white-32.png
else
  nohup ~/Downloads/Telegram/Telegram >/dev/null 2>&1 &
fi

