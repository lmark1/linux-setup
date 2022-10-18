#!/bin/bash

res=$(sudo systemctl status bluetooth | grep dead | wc -l)

if [[ $res -eq 0 ]]; then
  notify-send -u low -t 10000 "Bluetooth already active!" -h string:x-canonical-private-synchronous:anything
  exit
fi

# Do this
sudo modprobe btusb

res=$(sudo systemctl status bluetooth | grep running | wc -l)
if [[ $res -ne 0 ]]; then
  notify-send -u low -t 10000 "Bluetooth activated!" -h string:x-canonical-private-synchronous:anything
  exit
else
  notify-send -u low -t 10000 "Unable to activate bluetooth..." -h string:x-canonical-private-synchronous:anything
  exit
fi
