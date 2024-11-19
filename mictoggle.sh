#!/bin/bash

micValue=$(cat ~/mic_value.txt)

if [[ $micValue -eq 0 ]]; then
  notify-send "Mic" "on" -r 9849
  micValue=1  
else
  notify-send "Mic" "off" -r 9849
  micValue=0 
fi

echo $micValue > ~/mic_value.txt

~/utils/monitorMic.out $micValue
