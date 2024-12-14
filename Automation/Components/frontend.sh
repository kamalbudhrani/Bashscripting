#!/bin/bash

set -e                          # This is used to break/stop the script execution if any command in the script does not complete with success
COMPONENT=frontend
LOGFILE=/tmp/$COMPONENT.log

# Veirfy the script is being executed with root user or not
USERID=$(id -u)

if [ $USERID -ne 0 ] ; then
    echo -e "\e[31m You must run this script as root user or with sudo priviledges \e[0m"
    exit 1
fi

# This function is created to avoid repetative coding for same action, here same action is to print success or failure of every command
stat() {
    if [ $1 -eq 0 ] ; then
        echo -e "\e[32m Success \e[0m"
    else
        echo -e "\e[31m Failed \e[0m"
}

echo -n "Installing Nginix..."
    yum install nginx -y &>> $LOGFILE

    stat $?                         # Calling stat function which is declared above and $? will display the status (Success or failed) of the last command executed

echo -n "Downloading the component..."
    curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"
    stat $?

echo -n "Performing Cleanup..."
    rm -rf /usr/share/nginx/html/* &>> $LOGFILE

cd /usr/share/nginx/html
echo -n "Unzipping the $COMPONENT..."
    unzip /tmp/$COMPONENT.zip &>> LOGFILE
stat $?
mv $COMPONENT-main/* .
mv static/*
rm -rf $COMPONENT-main Readme.md &>> $LOGFILE

echo -n "Configuring the reverse proxy file..."
    mv localhost.conf /etc/nginx/default.d/roboshop.conf
stat $?

echo -n "Starting Frontend Service..."
    systemctl enable nginx &>> $LOGFILE
    systemctl start nginx &>> $LOGFILE
stat $?

# What I am planning to have?
# 1. If any step fail, I dont want to proceed further and want to break the script.
# 2. I want validation to happen first and then if it's a root or sudo user then only I want to run, if not I would like to break the script
# 3. I would like to add success/failure messages next to each instruction