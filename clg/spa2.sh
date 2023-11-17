#!/bin/bash
# This is a shell script to create a duplicate child process using & operator

# Get the process ID of the parent process
echo "The process ID of the parent process is $$"

# Run a command in the background and get its process ID
pid=$(sh &)

# Check the process ID of the background command
if [[ "$pid" -lt 0 ]]; then
  # The command failed
  echo "The command failed"
  exit 1
elif [[ "$pid" -eq 0 ]]; then
  # This is the background command
  echo "This is the background command"
  echo "The process ID of the background command is $$"
else
  # This is the parent process
  echo "This is the parent process"
  echo "The process ID of the background command is $pid"
fi

