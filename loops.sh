#!/bin/bash

# Loops based on inputs, for loop is the option

for games in Cricket Hockey Football Tennis Chess; do
    echo "Game name is ${games}
done

# Loops based on conditions, use While Loop

p=5
while [ $p -gt 0 ]; do
    echo Run number is $p
    p=$(($p-1))
done