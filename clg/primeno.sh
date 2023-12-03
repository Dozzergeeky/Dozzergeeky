#!/bin/bash

is_prime() {
    local num=$1
    if [ $num -lt 2 ]; then
        echo "$num is not a prime number."
        return 1
    fi

    for (( i=2; i*i<=num; i++ )); do
        if [ $((num % i)) -eq 0 ]; then
            echo "$num is not a prime number."
            return 1
        fi
    done

    echo "$num is a prime number."
    return 0
}

# Usage: Pass the number to check as the first argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <number_to_check>"
    exit 1
fi

is_prime "$1"
