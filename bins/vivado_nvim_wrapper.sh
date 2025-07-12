#!/bin/bash

# Set home explicitly
export HOME="/home/wepi"

# Clean up Vivado's environment
unset LD_LIBRARY_PATH
unset PYTHONPATH
unset PYTHONHOME
unset XDG_CONFIG_HOME
unset XDG_DATA_HOME
unset XDG_CACHE_HOME

# Set truecolor explicitly
export COLORTERM=truecolor

# LD_PRELOAD fix (if needed for Vivado's weirdness)
export LD_PRELOAD="/usr/lib/libssl.so.3"

# File to open
FILE_TO_OPEN="$1"

kitty -e nvim "$FILE_TO_OPEN"
