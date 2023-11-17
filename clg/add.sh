#!/bin/bash
#3. Write a shell script to add two numbers. Inputs are takenfrom user.
echo "Enter the first number: "
read num1 
echo "Enter the second number: "
read num2 
sum=$((num1 + num2)) 
echo "The sum of $num1 and $num2 is $sum" 

