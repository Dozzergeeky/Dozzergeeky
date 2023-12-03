#!/bin/bash

check_factorial() {
    local num=$1
    local factorial=1
    local i=1

    while [ $factorial -le $num ]; do
        if [ $factorial -eq $num ]; then
            echo "$num is a factorial of $i"
            return 0  # Exit with success status
        fi
        ((i++))
        factorial=$((factorial * i))
    done

    echo "$num is not a factorial of any number"
    return 1  # Exit with failure status
}

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <number_to_check>"
    exit 1
fi

check_factorial "$1"
