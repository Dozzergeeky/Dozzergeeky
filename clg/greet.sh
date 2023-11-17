#!/bin/bash
# This is a shell script to display a greeting message based on the system time
hour=$(date +%H) # Get the hour in 24-hour format
if [ $hour -lt 12 ]; then # If the hour is less than 12
  echo "Good morning" # Display good morning
elif [ $hour -lt 18 ]; then # If the hour is less than 18
  echo "Good afternoon" # Display good afternoon
elif [ $hour -lt 22 ]; then # If the hour is less than 22
  echo "Good evening" # Display good evening
else # Otherwise
  echo "Good night" # Display good night
fi

