#!/bin/bash
# find out drive id with lsusb
DRIVE_ID='0bc2:231a'

# pull/clone all github repos of user lulu98 -> use python script
# TODO: all
#./pull-github-repos.py lulu98 ${HOME}/Documents/Projects/GitHub/
zenity --question --text "Do you want to update git repos?"
[ $? -eq 0 ] || exit 1

# back up to cloud
# TODO: all
zenity --question --text "Do you want to make backup to cloud?"
[ $? -eq 0 ] || exit 1

# back up to external hard drive
# TODO: implement the actual syncing with rsync
zenity --question --text "Do you want to make backup to external hard drive?"
# Checking if user wants to proceed
[ $? -eq 0 ] || exit 1

while [ $(lsusb -d $DRIVE_ID | wc -l) -eq 0 ]
do
	notify-send 'Attention!' 'Please insert hard drive for backup!'
	sleep 30	
done
notify-send 'Back up is starting now...'
sleep 5
notify-send 'Back up completed.'
