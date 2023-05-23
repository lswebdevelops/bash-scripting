#!/bin/bash
#clean up version 2 

#Run as root
#insert code here ot print error message and exit if not root.

LOG_DIR=/var/log

cd $LOG_DIR

cat /dev/null > messages
cat /dev/null > wtmp

echo "Logs cleaned up"

exit 
        # The right and proper method of "exiting" from a script.
        #  A bare "exit" (no parameter) returns the exit status
        #+ of the preceding command. 

