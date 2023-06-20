#!/bin/bash
# 
#testing special Characters
# creates file test.txt if not there
filename="test.txt"
echo hello; echo there 

if [ -x "$filename" ]; then 
    echo "File $filename exists."; cp $filename $filename.bak
else
    echo "File $filename not found."; touch $filename 
fi; echo "File test complete."
