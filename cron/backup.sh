#!/bin/bash
# TODO: answer question where to put this script: https://unix.stackexchange.com/questions/201768/storing-shell-scripts

notify-send 'Backup script started!'

# pull/clone all github repos of user specified in python script 
zenity --question --text "Do you want to update GitHub repos before backup?" 2> /dev/null
if [ $? -eq 0 ]
then 
	/usr/bin/python pull-github-repos.py	
	notify-send 'Cloning/Pulling GitHub repos completed.'
	sleep 5
fi

# back up to cloud
# TODO: all
zenity --question --text "Do you want to make backup to cloud?" 2> /dev/null
if [ $? -eq 0 ]
then
	/bin/bash backup-cloud.sh	
	notify-send 'Back up to cloud completed.'
	sleep 5
fi       

# back up to external hard drive
# TODO: implement the actual syncing with rsync
zenity --question --text "Do you want to make backup to external hard drive?" 2> /dev/null
if [ $? -eq 0 ]
then 
	/bin/bash backup-external-drive.sh	
	notify-send 'Back up to external drive completed.'
	sleep 5
fi

notify-send 'Backup script completed!'
