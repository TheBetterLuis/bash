#!/bin/bash

# Press Alt key
xdotool keydown Alt
sleep 0.1

# Press Shift key
xdotool keydown Shift
sleep 0.1

# Press Return key
xdotool key Return
sleep 0.1

# Release Shift key
xdotool keyup Shift
sleep 0.1

# Release Alt key
xdotool keyup Alt

