#!/bin/bash


# Define the file paths for mic loopback index and mic value
micLoopbackFile=~/mic_loopback_index.txt
micValueFile=~/mic_value.txt

# Function to load the microphone loopback module
load_mic_loopback() {
  mic_loopback_index=$(pactl load-module module-loopback source=easyeffects_source sink=monitor_sink)
  echo $mic_loopback_index > $micLoopbackFile
  notify-send "Mic (this doesn't mute mic)" "monitoring turned on" -r 9849 -i ~/Pictures/icons/mic-unmute-white-32.png
}


#easyeffects_source

# Function to unload the microphone loopback module
unload_mic_loopback() {
  if [[ -f $micLoopbackFile ]]; then
    mic_loopback_index=$(cat $micLoopbackFile)
    pactl unload-module $mic_loopback_index
    rm $micLoopbackFile
  fi
  notify-send "Mic (this doesn't mute mic)" "monitoring turned off" -r 9849 -i ~/Pictures/icons/mic-mute-red-32.png
}


# Read the current mic value
micValue=$(cat $micValueFile)

 #Toggle the microphone loopback state based on the current mic value
if [[ $micValue -eq 0 ]]; then
  load_mic_loopback
  micValue=1
else
  unload_mic_loopback
  micValue=0
fi

# Save the new mic value
echo $micValue > $micValueFile

