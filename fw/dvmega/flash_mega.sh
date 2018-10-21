#! /bin/bash
systemctl stop pistar-watchdog.service
systemctl stop dstarrepeater.service
systemctl stop pistar-watchdog.timer
systemctl stop dstarrepeater.timer
systemctl stop mmdvmhost.timer
systemctl stop mmdvmhost.service

sudo mount -o remount,rw /
FIRMWARE=./dvmega/*.hex
for found in $FIRMWARE
do
  echo "Found $found firmware..."
  # take action on this file, upload it using special commands to dvmega.
 /usr/bin/avrdude-original -p m328p -c arduino -P /dev/ttyUSB0 -b 57600  -D  -F -U flash:w:${found} -v 
 
  # move to backup-folder, and reboot the unit
  sudo mv ${found} ./dvmega/backup
  sudo reboot
done
