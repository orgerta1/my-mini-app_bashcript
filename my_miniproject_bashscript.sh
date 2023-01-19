#!/bin/bash

USERNAME_FILENAME="username.file"
JOKES_SCRIPT_PATH="home/orgerta/bash_practice/personal_shpresa/resources/jokes/jokes.sh"
WEATHER_SCRIPT_PATH="home/orgerta/bash_practice/personal_shpresa/resources/weather/weather.sh"

USERNAME=$(<$USERNAME_FILENAME)

if [ -z $USERNAME ]
then
	echo "Application is not installed. Exiting..."
	sleep 0.8
	exit 0
fi

echo "Hello there $USERNAME"

#Functions
function displayMenu () {
	declare -a menuItems=( 'Show me the weather for next week!' 'Tell me a joke!' 'Show me the date!' 'Show me song lyrics!' 'Exit' )

	COUNTER=1
	for ((i=0; i < ${#menuItems[@]}; i++))
	do
		echo "($COUNTER) ${menuItems[$i]}"
		((COUNTER++))
	done
}

function checkAndExecScript () {
	FILEPATH=$1
	if ! [ -f $FILEPATH ]
        then
                echo "$FILEPATH does not exist"
        elif ! [ -x $FILEPATH ]
        then
                echo "You do not have the permission to execute $FILEPATH"
        else
                source $FILEPATH
        fi
}
#

#Logic
while true
do
	echo ""
	echo "*********************************"
	echo "How can I help you today?"
        
	displayMenu
	
        read -p "Choose an option: " OPTION
	echo "*********************************"
	echo ""

        case "$OPTION" in
	"1")
		sleep 0.8
		checkAndExecScript $WEATHER_SCRIPT_PATH
		;;
	"2")
		sleep 0.8
		checkAndExecScript $JOKES_SCRIPT_PATH
		;;
	"3")
		sleep 0.8
		echo "Today's date is $(date)"
		;;
        "5")
		sleep 0.8
                echo "Exiting, goodbye $USERNAME!"
                exit 0;;
	*)  
		sleep 0.8
            	echo "Please input a correct value!"
        esac
done
