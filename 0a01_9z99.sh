#!/bin/bash

# Define the characters you want to mix with numbers
characters="abcdefghijklmnopqrstuvwxyz"
number_format="%02d" # Format for the numeric part (e.g., 01, 02, 03, ...)

# Outer loop for the first letter (0-9)
for first_digit in {0..9}; do
    # Loop for the second letter (a-z)
    for second_letter in $(echo $characters | grep -o .); do
        # Inner loop for numbers
        for number in {1..99}; do # Change the range as needed
            printf "%s%s%02d\n" "$first_digit" "$second_letter" "$number"
        done
    done
done
