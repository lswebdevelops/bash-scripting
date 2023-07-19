#!/bin/bash

# Function to generate the next combination of letters and numbers
next_combination() {
    local current_comb=$1
    local letter=$(echo "$current_comb" | grep -o -E '[a-z]')
    local num=$(echo "$current_comb" | grep -o -E '[0-9]+' | sed 's/^0*//') # Remove leading zeros

    if [[ "$num" -eq 999 ]]; then
        num=0
        if [[ "$letter" == 'z' ]]; then
            letter='0'
        else
            letter=$(echo -n "$letter" | tr 'a-y' 'b-z')
        fi
    else
        num=$((num + 1))
    fi

    printf "%s%03d\n" "$letter" "$num"
}

# Start with 'a001'
current_comb="a000"

# Loop to generate the combinations and print them
for ((i = 0; i < 10000; i++)); do
    current_comb=$(next_combination "$current_comb")
    echo "$current_comb"
done

