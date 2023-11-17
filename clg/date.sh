#!/bin/bash
# This is a shell script to print today's date, current time and current month's calendar

# Get today's date in YYYY-MM-DD format
date=$(date +%F)

# Get current time in HH:MM:SS format
time=$(date +%T)

# Get current month's calendar
calendar=$(cal)

# Print the results
echo "Today's date is $date"
echo "Current time is $time"
echo "Current month's calendar is:"
echo "$calendar"

