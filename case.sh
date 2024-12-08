#!/bin/bash

# Syntax to use case in bash scripting

# case $var in
# opt1) commands ;;
# opt2) commands ;;
# esac

Action=$1

read -p 'Enter your oprion :' Option
$Option > $Action

case $Action in


start)
    echo "Starting the service"
    exit 0 ;;
stop)
    echo "Stopping the service"
    exit 1 ;;
*)
    echo -e "\e[31m Valid options are either start or stop \e[0m"
    exit 2

esac