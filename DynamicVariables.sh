#!/bin/bash

# Expressions are always enclosed in Paranthesis

Today_Date="$(date +%F)"
No_of_Users="$(who | wc -l)"

echo "Hello, Good Morning Todays date is ${Today_Date}"
echo "Number of sessions opened are ${No_of_Users}"