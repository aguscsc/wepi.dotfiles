#!/bin/bash

# Get total and used memory (in MB)
MEM_INFO=$(free -m | awk '/Mem:/ {print $2, $3}')
TOTAL_MB=$(echo $MEM_INFO | awk '{print $1}')
USED_MB=$(echo $MEM_INFO | awk '{print $2}')

# Convert to GB (1 decimal point)
TOTAL_GB=$(awk "BEGIN {printf \"%.1f\", $TOTAL_MB/1024}")
USED_GB=$(awk "BEGIN {printf \"%.1f\", $USED_MB/1024}")

# Output in JSON for Waybar
echo "{\"text\":\"${USED_GB}G/${TOTAL_GB}G\"}"
