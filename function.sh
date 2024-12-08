#!/bin/bash

# Declaring a function

sample() {
    echo "I am creating my first function named sample"
}

# Calling function sample
sample

stat() {
    echo "Load average on the system is $(uptime | awk -F : '{print$NF}' | awk -F , '{print$1}')"
    echo "Number of logged in sessions are $(who | wc -l)"
    echo "..........Calling sample function..............."
    sample   # Calling sample function inside stat function
}

