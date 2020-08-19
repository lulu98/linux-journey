#!/bin/bash
# find out drive id with lsusb
DRIVE_ID='0bc2:231a'

while [ $(lsusb -d $DRIVE_ID | wc -l) -eq 0 ]
do
        notify-send 'Attention!' 'Please insert hard drive for backup!'
        sleep 30
done
notify-send 'Back up to external drive is starting now...'
# TODO: implement backup with rsync command
sleep 5
