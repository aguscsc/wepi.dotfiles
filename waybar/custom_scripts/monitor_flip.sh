#!/bin/bash

MONITOR="HDMI-A-5"

# Get current transform value
TRANSFORM=$(hyprctl monitors -j | jq -r ".[] | select(.name==\"$MONITOR\").transform")

if [ "$TRANSFORM" == "0" ]; then
    # Switch to vertical
    hyprctl keyword monitor "$MONITOR, 1920x1080@75, 0x0,1,transform,1"
else
    # Switch to normal
    hyprctl keyword monitor "$MONITOR, 1920x1080@75, 1920x0,1"
fi
