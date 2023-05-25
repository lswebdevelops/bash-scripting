#!/bin/bash

# Reading lines in /etc/jstab

File=/etc/fstab

{
    read line1
    read line2
    read line3
} < $File

echo "Fist line in $File is: "
echo -e "\n$line1\n"
echo "Second line in $File is: "
echo -e "\n$line2\n"
echo "Third line in $File is: "
echo -e "\n$line3\n"


#Read the file line by line
while IFS= read -r line; do
    # set the line as positional parameters
    set -- $line

    #access and process each field
    for field in "$@"; do 
        #Do something with the field
        echo "Field: $field"
    done

done < $File


exit 0

# Now, how do you parse the separate fields of each line?
# Hint: use awk, or . . .
# . . . Hans-Joerg Diers suggests using the "set" Bash builtin.

