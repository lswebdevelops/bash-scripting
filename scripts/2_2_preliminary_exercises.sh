#!/bin/bash 

# Write a script that upon invocation shows the time and date, 
# lists all logged-in users, and gives the system uptime.
#  The script then saves this information to a logfile.
RAMDOMNUMBER=$(date +%N)
YEAR=$(date +%Y)
MONTH=$(date +%m)
DAY=$(date +%d)
TIME=$(date +%H:%M:%S)
UPTIME_TIME=$(uptime | cut -d ' ' -f2)
UPTIME_DAY=$(uptime | cut -d ' ' -f4)
UPTIME_USERS=$(uptime | cut -d ' ' -f9)
UPTIME_MIN=$(uptime | cut -d ' ' -f6)


exec > \2_2_preliminary_exercises.$RAMDOMNUMBER.log
echo "Listing time and date:"

echo "Today is $YEAR/$MONTH/$DAY, and it's: $TIME now."

echo "---------------------------------------"

echo "listing all logged in users:"

who | cut -d " " -f1

echo "This system has been awake since $UPTIME_TIME."
echo "$UPTIME_DAY day(s), and $UPTIME_MIN minutes and there are $UPTIME_USERS active user(s)."




