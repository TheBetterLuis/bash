#!/bin/bash

micValue=$(cat ~/mic_value.txt)

if [[ $micValue -eq 0 ]]; then
  micValue=1  
else
  micValue=0 
fi

echo $micValue > ~/mic_value.txt

~/utils/monitorMic.out $micValue
