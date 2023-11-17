#!/bin/bash

# Get the file name as an argument
filename=$1

# Check if the file name was provided
if [ -z "$filename" ]; then
    echo "Error: Please provide a file name as an argument."
    exit 1
fi

# Get the default file permissions
default_permissions=$(stat -c %a "$filename")

# Display the default file permissions
echo "Default file permissions: $default_permissions"

# Change the file permission as user has all permissions, group users has only read
# and write permission and other can only read.
chmod ugo+rwx,g-x "$filename"
new_permissions=$(stat -c %a "$filename")

# Display the new file permissions
echo "New file permissions: $new_permissions"

# Change the file permission so that the user has exactly all the permissions.
chmod u+rwx "$filename"
new_permissions=$(stat -c %a "$filename")

# Display the new file permissions
echo "New file permissions: $new_permissions"

# Change the file permission so that the user, group users and other have all permissions.
chmod a+rwx "$filename"
new_permissions=$(stat -c %a "$filename")

# Display the new file permissions
echo "New file permissions: $new_permissions"

