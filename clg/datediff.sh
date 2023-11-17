#!/bin/bash

# Read the first date from user input and convert it to yyyy-mm-dd format
read -p "Enter the first date (dd/mm/yyyy): " date1
date1=$(echo $date1 | awk -F/ '{print $3"-"$2"-"$1}')

# Read the second date from user input and convert it to yyyy-mm-dd format
read -p "Enter the second date (dd/mm/yyyy): " date2
date2=$(echo $date2 | awk -F/ '{print $3"-"$2"-"$1}')

# Calculate the difference in seconds using date command
diff=$(($(date -d $date2 +%s) - $(date -d $date1 +%s)))

# Convert the difference to days by dividing by 86400
days=$(($diff / 86400))

# Print the result
echo "The difference between $date1 and $date2 is $days days."

