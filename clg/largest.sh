#!/bin/bash
echo "Enter the first number: "
read num1
echo "Enter the second number: "
read num2 
echo "Enter the third number: "
read num3
if [ $num1 -gt $num2 ] && [ $num1 -gt $num3 ]; then 
  echo "$num1 is the largest number." 
elif [ $num2 -gt $num3 ]; then 
  echo "$num2 is the largest number." the result
else 
  echo "$num3 is the largest number."
fi

