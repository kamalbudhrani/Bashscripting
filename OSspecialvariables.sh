#!/bin/bash

# Special variables in linux are : $0 to $n , $* , $# , $@ , $$

echo $0     # Prints the script name that you are running
echo $1     # Prints First argument from command line
echo $2     # Prints Second argument from command line

echo $*     # Gives you all the arguments used in the script
echo $@     # Gives you all the arguments used in the script
echo $#     # Gives you the number of arguments used

# On command you can supply 9 variables
# Example : sh abc.sh 10 20 30 40