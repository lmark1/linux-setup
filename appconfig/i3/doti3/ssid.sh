#!/bin/bash

ssid="$(iwgetid -r)"
[ -z "$ssid" ] && echo "NO SSID"

echo $ssid # full text
