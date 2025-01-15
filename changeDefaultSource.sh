#!/bin/bash

if [ "$(pactl get-default-source)" = "alsa_input.usb-0c76_USB_PnP_Audio_Device-00.mono-fallback" ]; then
  pactl set-default-source easyeffects_source
  notify-send "Source(mic) changed to" "$(pactl get-default-source)" -r 2222 -i ~/Pictures/icons/alert-white-32.png
else
  pactl set-default-source alsa_input.usb-0c76_USB_PnP_Audio_Device-00.mono-fallback
  notify-send "Source(mic) changed to" "$(pactl get-default-source)" -r 2222 -i ~/Pictures/icons/alert-white-32.png
fi

