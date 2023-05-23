#!/bin/bash
##clean up version 3




LOG_DIR=/var/log
ROOT_UID=0     # Only users with $UID 0 have root privileges.
LINES=50       # Default number of lines saved.
E_XCD=86       # Can't change directory?
E_NOTROOT=87   # Non-root exit error.

#insert code here ot print error message and exit if not root.
#Run as root
if [ "$UID" -ne "$ROOT_UID" ]
then 
    echo "Must be root to run this script."
    exit $E_NOTROOT
fi

if [ -n "$1" ]
# test whether command-line argument is present (non-empty).
then
    lines=$1
else
    lines=$LINES #default, if not specified on command-line.
fi


if  [ `pwd` != "$LOG_DIR" ] #or if [ "$PWD" != "$LOG_DIR" ]
                            #not in /var/log?
then
    echo "Cannot change to $LOG_DIR."
    exit $E_XCD
fi # Doublecheck if in right directory befor messing with log file.


# Far more efficient is:
#
# cd /var/log || {
#   echo "Cannot change to necessary directory." >&2
#   exit $E_XCD;
# }

tail -n $lines messages > mesg.temp #Save last section of message log file.
mv mesg.temp message                #rename it as system log file.

# cat /dev/null > messages
#   no longer needed, as the above method is safer. 

cat /dev/null > wtmp # ': > wtmp' and '> wtmp' have the same effect.

echo "Logs cleaned up"
# note that there are other log files in /var/log not affedted by this script.

exit 0
        # The right and proper method of "exiting" from a script.
        #  A bare "exit" (no parameter) returns the exit status
        #+ of the preceding command. 


