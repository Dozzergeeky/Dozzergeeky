#!/bin/bash

# 1. Write a program to print the process id and parent process id.

# Use the getpid() and getppid() functions to get the process id and parent process id
# Reference: [1]
echo "The process id of this script is $$"
echo "The parent process id of this script is $PPID"
