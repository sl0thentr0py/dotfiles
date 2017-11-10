#! /usr/bin/bash
# Sets right perspective when monitor is plugged in
# Needed by udev rule /etc/udev/rules.d/95-hotplug-monitor
export DISPLAY=:0
export XAUTHORITY=/home/neel/.Xauthority

function connect(){
	xrandr --output HDMI1 --mode 1920x1080 --pos 1280x0 --output LVDS1 --primary --mode 1280x800 --pos 0x0
  sleep 1
  sudo -u neel /home/neel/.config/polybar/launch.sh
}

function disconnect(){
      xrandr --output HDMI1 --off
      sleep 1
      sudo -u neel home/neel/.config/polybar/launch.sh
}

xrandr | grep "HDMI1 connected" &> /dev/null && connect || disconnect
