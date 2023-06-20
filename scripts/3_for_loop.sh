#!/bin/bash

for file in /{,usr/}bin/*calc
#             ^     find all executalbe files ending in 'calc'
# +  in /bin and /usr/bin directories.

do 
    if [ -x "$file" ]
    then
        echo $file
    fi 
done


