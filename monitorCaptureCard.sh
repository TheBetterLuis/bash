#!/bin/bash

# Define the file paths for mic loopback index and mic value
captureCardLoopbackFile=~/capture_card_loopback_index.txt
captureCardValueFile=~/captureCard_value.txt

# Function to load the microphone loopback module
load_mic_loopback() {
  capture_card_index=$(pactl load-module module-loopback source=alsa_input.usb-MACROSILICON_2109-02.pro-input-0 sink=monitor_sink)
  echo $capture_card_index > $captureCardLoopbackFile
  notify-send "Mic (this doesn't mute mic)" "monitoring turned on" -r 9849 -i ~/Pictures/icons/mic-unmute-white-32.png
}

# Function to unload the microphone loopback module
unload_mic_loopback() {
  if [[ -f $captureCardLoopbackFile ]]; then
    capture_card_index=$(cat $captureCardLoopbackFile)
    pactl unload-module $capture_card_index
    rm $captureCardLoopbackFile
  fi
  notify-send "Mic (this doesn't mute mic)" "monitoring turned off" -r 9849 -i ~/Pictures/icons/mic-mute-red-32.png
}


# Read the current mic value
captureCardValue=$(cat $captureCardValueFile)

 #Toggle the microphone loopback state based on the current mic value
if [[ $captureCardValue -eq 0 ]]; then
  load_mic_loopback
  captureCardValue=1
else
  unload_mic_loopback
  captureCardValue=0
fi

# Save the new mic value
echo $captureCardValue > $captureCardValueFile

