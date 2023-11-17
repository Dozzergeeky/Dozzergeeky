#!/bin/bash
# This is a shell script to fetch the mth line of a file and store it into another file
echo "Enter the name of the input file: "
read input # Read the name of the input file from the user
echo "Enter the name of the output file: "
read output # Read the name of the output file from the user
echo "Enter the line number you want to fetch: "
read line # Read the line number from the user
sed -n "${line}p" < "$input" > "$output" # Use sed to print the specified line from the input file and redirect it to the output file
echo "The $line-th line of $input has been stored in $output" # Print a confirmation message

