#!/bin/bash
# This is a shell script to sort an array of numbers in ascending order
echo "Enter the numbers separated by spaces: "
read -a array # Read the numbers from the user and store them in an array
sorted=($(printf '%s\n' "${array[@]}" | sort -n)) # Sort the array
echo "The sorted array is: ${sorted[*]}" # Print the sorted array
