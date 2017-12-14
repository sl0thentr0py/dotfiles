#!/bin/bash
# Sets right perspective when monitor is plugged in
# Needed by udev rule /etc/udev/rules.d/95-hotplug-monitor
export DISPLAY=:0
export XAUTHORITY=/home/neel/.Xauthority

function connect(){
  xrandr --output VIRTUAL1 --off --output DP3 --off --output DP2 --off --output DP1 --mode 2560x1440 --pos 1280x0 --rotate normal --output HDMI3 --off --output HDMI2 --off --output HDMI1 --off --output LVDS1 --primary --mode 1280x800 --pos 0x1360 --dpi 113 --rotate normal --output VGA1 --off
}

function disconnect(){
  xrandr --output VIRTUAL1 --off --output DP3 --off --output DP2 --off --output DP1 --off --output HDMI3 --off --output HDMI2 --off --output HDMI1 --off --output LVDS1 --primary --mode 1280x800 --pos 0x0 --dpi 113 --rotate normal --output VGA1 --off
}

xrandr | grep "DP1 connected" &> /dev/null && connect || disconnect

# only relaunch bars if not init mode
if ! [ "$INIT_MODE" = "1" ]; then
  sleep 1
  echo "re-launching bars"
  /home/neel/.config/polybar/launch.sh
fi
