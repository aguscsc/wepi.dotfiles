#!/bin/bash

MIC_SOURCE=$(pactl get-default-source)

if [ -z "$MIC_SOURCE" ]; then
    echo '{"text":"󰍭","tooltip":false}'
    exit 0
fi

MUTE_STATUS=$(pactl get-source-mute "$MIC_SOURCE" | awk '{print $2}')

if [ "$MUTE_STATUS" == "yes" ]; then
    echo '<span >󰍭</span>'
else
    echo '<span >󰍬</span>'
fi
