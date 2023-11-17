#!/bin/bash
# This is a shell script to print a message from a child process and a parent process in a time sharing environment

# Get the process ID of the parent process
parent_pid=$$

# Define a function to print a message from the child process
child_message () {
  echo "I am the child process with PID $$ and my parent's PID is $parent_pid"
}

# Fork a child process and run the function
(child_message) &

# Wait for the child process to finish
wait

# Print a message from the parent process
echo "I am the parent process with PID $$ and I have finished waiting for my child"

