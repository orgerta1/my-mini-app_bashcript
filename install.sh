#!/bin/bash

USERNAME_FILENAME="username.file"
MAIN_SCRIPT="shpresa.sh"
UNINSTALL_SCRIPT="uninstall.sh"

if ! [ -s $USERNAME_FILENAME ]
then
        read -p "Please enter your name: " USERNAME

	echo "Creating username file"
	sleep 0.5
	echo $USERNAME > $USERNAME_FILENAME
	echo "Username file created!"
fi

if ! [ -x $MAIN_SCRIPT ]
then
	chmod 744 $MAIN_SCRIPT
fi

if ! [ -x $UNINSTALL_SCRIPT ]
then
	chmod 744 $UNINSTALL_SCRIPT
fi

echo "Application sucessfully installed!"
