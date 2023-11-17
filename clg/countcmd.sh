#!/bin/bash

# Store the number of arguments in a variable
count=$#

# Loop through the arguments and concatenate them in a variable
text=""
for arg in "$@"
do
  text+="$arg "
done

# Remove the trailing space from the text
text=${text% }

# Convert the text to upper case using tr command
text=$(echo $text | tr ' [:lower:]' ' [:upper:]')

# Print the text and the count
echo "The text is: $text"
echo "The number of arguments is: $count"

