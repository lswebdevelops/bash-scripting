#!/bin/bash

# Define the characters you want to mix with numbers
characters="abcdefghijklmnopqrstuvwxyz"
number_format="%03d" # Format for the numeric part (e.g., 001, 002, 003, ...)
number_format_v2="%02d" # Format for the numeric part in the second loop (e.g., 01, 02, 03, ...)

# Outer loop for letters
for letter in $(echo $characters | grep -o .); do
    # Inner loop for numbers (a001 to a999)
    for number in {1..999}; do
        printf "%s%03d\n" "$letter" "$number"
    done
done

# Second outer loop for the first letter (0-9)
for first_digit in {0..9}; do
    # Second loop for the second letter (a-z)
    for second_letter in $(echo $characters | grep -o .); do
        # Second inner loop for numbers (0a01 to 9z99)
        for number_v2 in {1..99}; do
            printf "%s%s%02d\n" "$first_digit" "$second_letter" "$number_v2"
        done
    done
done
