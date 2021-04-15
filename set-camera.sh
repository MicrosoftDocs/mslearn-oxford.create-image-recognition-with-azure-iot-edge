#!/bin/bash

# USB Camera Settings - most import is to turn off the auto focus
# https://www.kurokesu.com/main/2016/01/16/manual-usb-camera-settings-in-linux/
# v4l2-ctl -d /dev/video0 --list-ctrls

# sudo apt-get install v4l-utils

v4l2-ctl --set-ctrl=power_line_frequency=1
v4l2-ctl --set-ctrl=focus_auto=0
v4l2-ctl --set-ctrl=brightness=150
v4l2-ctl --set-ctrl=contrast=7
v4l2-ctl --set-ctrl=saturation=100
v4l2-ctl --set-ctrl=focus_absolute=20
v4l2-ctl --set-ctrl=zoom_absolute=20



# Potential new settings

# http://www.ideasonboard.org/uvc/faq/#faq6
# https://stackoverflow.com/questions/25619309/how-do-i-enable-the-uvc-quirk-fix-bandwidth-quirk-in-linux-uvc-driverhttps://stackoverflow.com/questions/25619309/how-do-i-enable-the-uvc-quirk-fix-bandwidth-quirk-in-linux-uvc-driver
# https://stackoverflow.com/questions/25619309/how-do-i-enable-the-uvc-quirk-fix-bandwidth-quirk-in-linux-uvc-driver
# https://stackoverflow.com/questions/9781770/capturing-multiple-webcams-uvcvideo-with-opencv-on-linux/23881125#23881125

# o make umläute's answer survive reboots, I created file /etc/modprobe.d/uvcvideo.conf with content

#options uvcvideo quirks=0x80
#To get the module to reload uvcvideo.conf, unload and load the module:

sudo rmmod uvcvideo
sudo modprobe uvcvideo nodrop=1 timeout=5000 quirks=0x80
#modinfo uvcvideo

#v4l2-ctl --set-ctrl=power_line_frequency=1
#v4l2-ctl --set-ctrl=focus_auto=0
#v4l2-ctl --set-ctrl=focus_absolute=20