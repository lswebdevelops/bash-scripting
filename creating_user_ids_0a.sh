#!/bin/bash

# Loop to generate the combinations and print them
for ((i = 0; i < 1000; i++)); do
    if ((i < 10)); then
        num="00$i"
    elif ((i < 100)); then
        num="0$i"
    else
        num="$i"
    fi

    if ((i < 260)); then
        # Print the letters (a-z)
        letter=$(printf "%c" $((i / 10 + 97)))
        echo "$letter$num"
    elif ((i < 270)); then
        # After reaching z99, print 0a01 to 0z99
        letter=$(printf "%c" $(((i - 260) + 97)))
        echo "0$letter$num"
    else
        # After reaching 0z99, print "Reached limit" and exit
        echo "Reached limit (0z99)"
        exit 0
    fi
done
