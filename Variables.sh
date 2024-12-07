#!/bin/bash

# Variable is something which holds the values dynamically.

# Below variables are called local variables
a=10
b=20
c=100

# No concept of data types in shell-scripting
# Everything is considered as string by default

echo $a
echo ${a}
echo "$a"
echo "${b}"

echo "Print the value of c = $c"

echo '$(a)'

# Whenever you use single quotes on variable, the power of special character will be taken down
# Here $ is a special character to print variables.
# Local variables will have higher priority than export variables (Environment Variables)