#!/bin/bash

# Define the characters you want to mix with numbers
characters="abcdefghijklmnopqrstuvwxyz"
number_format="%03d" # Format for the numeric part (e.g., 001, 002, 003, ...)

# Outer loop for letters
for letter in $(echo $characters | grep -o .); do
    # Inner loop for numbers
    for number in {1..999}; do # Change the range as needed
        printf "%s%03d\n" "$letter" "$number"
    done
done
