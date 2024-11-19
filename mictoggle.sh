#!/bin/bash

micValue=$(cat ~/mic_value.txt)

if [[ $micValue -eq 0 ]]; then
  notify-send "Mic (this doesn't mute mic)" "monitoring turned on" -r 9849 -i ~/Pictures/icons/mic-unmute-white-32.png
  micValue=1  
else
  notify-send "Mic (this doesn't mute mic)" "monitoring turned off" -r 9849 -i ~/Pictures/icons/mic-mute-red-32.png
  micValue=0 
fi

echo $micValue > ~/mic_value.txt

nohup ~/utils/monitorMic.out $micValue >/dev/null 2>&1 &
