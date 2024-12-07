#!/bin/bash

# Special variables in linux are : $0 to $n , $* , $# , $@ , $$

echo "Name of the executed script is : $0" # Prints the script name that you are running
echo "First argument from command line : $1"
echo "Second argument from command line : $2"

# On command you can supply 9 variables
# Example : sh abc.sh 10 20 30 40