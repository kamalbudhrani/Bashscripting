#!/bin/bash

# Variable is something which holds the values dynamically.

a=10
b=20

# No concept of data types in shell-scripting
# Everything is considered as string by default

echo $a
echo ${a}
echo "$a"
echo "$(b)"

echo '$(a)'

# Whenever you use single quotes on variable, the power of special character will be taken down
# Here $ is a special character to print variables.