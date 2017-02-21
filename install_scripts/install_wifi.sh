#!/bin/bash

# install_wifi.sh

# scane for wifi network
sudo iwlist wlan0 scan | grep ESSID

cat <<<"
1. Find ESSID
2. Enter:
network={
  ssid="MYESSID"
  psk="MYWIFIPASS"
}
"
sleep 5
sudo vim /etc/wpa_supplicant/wpa_supplicant.conf
 
echo "Restarting wlan0..."
sleep 2
sudo ifdown wlan0
sleep 1
sudo ifup wlan0

echo "$0 Done"

