#!/bin/bash

# Function to generate the next combination of letters and numbers
next_combination() {
    local current_comb=$1
    local letter=$(echo "$current_comb" | grep -o -E '^[a-z_]')
    local num=$(echo "$current_comb" | grep -o -E '[0-9]+' | sed 's/^0*//') # Remove leading zeros

    if [[ "$letter" == 'z' && "$num" -eq 999 ]]; then
        letter='_'
        num=1
    elif [[ "$letter" == '_' && "$num" -eq 99 ]]; then
        echo "Reached limit (_z99)"
        exit 0
    elif [[ "$num" -eq 999 ]]; then
        letter=$(echo -n "$letter" | tr 'a-y' 'b-z')
        num=0
    else
        num=$((num + 1))
    fi

    # Add leading zeros back to the number
    printf "%s%02d\n" "$letter" "$num"
}

# Start with 'a001'
current_comb="z900"

# Loop to generate the combinations and print them
while true; do
    current_comb=$(next_combination "$current_comb")
    echo "$current_comb"
done
