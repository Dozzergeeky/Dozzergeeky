#!/bin/bash
# This is a shell script to sort an array of numbers in ascending order
echo "Enter the numbers separated by spaces: "
read -a array # Read the numbers from the user and store them in an array
IFS=$'\n' sorted=($(sort -n <<<"${array[*]}")) # Use sort to sort the array numerically and store the result in another array
unset IFS # Reset the IFS to the default value
echo "The sorted array is: ${sorted[*]}" # Print the sorted array

