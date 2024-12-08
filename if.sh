#!/bin/bash

# Demo on if and if-else

a="abcd"

if [ "$a" == "abcd"]; then
    echo -e "\e[32m Both of them are equal \e[0m"
else
    echo -e "\e[31m Both of them are not equal \e[0m"
fi

# Demo on not equals string operator

if [ "$b" != "abcd"]; then
    echo -e "\e[31m Both of them are not equal \e[0m"
fi

if [ -z $b ]; then
    echo "variable b is empty"
fi

# Demo on else if

c=$1

if ["$c" -eq "10"]; then
    echo "Value of c is 10"
elif ["$c" -eq "20"]; then
    echo "Value of c is 20"
elif ["$c" -eq "30"]; then
    echo "Value of c is 30"
else
    echo "Value of c is not 10 or 20 or 30"
fi