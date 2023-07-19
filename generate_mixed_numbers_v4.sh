#!/bin/bash

# Define the characters you want to mix with numbers
characters="abcdefghijklmnopqrstuvwxyz"
number_format="%01d" # Format for the numeric part (e.g., 1, 2, 3, ...)
number_format_v2="%02d" # Format for the numeric part in the second loop (e.g., 01, 02, 03, ...)

# Outer loop for the first digit (00-99)
for first_digit in {0..9}{0..9}; do
    # Loop for the second letter (a-z)
    for second_letter in $(echo $characters | grep -o .); do
        # Inner loop for numbers (1-9)
        for number in {1..9}; do
            printf "%s%s%01d\n" "$first_digit" "$second_letter" "$number"
        done
    done
done
