#!/bin/bash

set -e                          # This is used to break/stop the script execution if any command in the script does not complete with success
COMPONENT=frontend

source common.sh     # source is used to call the functions or expressions declared outside this script, like for this stat function and root priviledge expression are declared in common.sh script which is present outside this script inside Components folder, whatever functions or expressions declared in common.sh will be called when we use source command

echo -n "Installing Nginix..."
    yum install nginx -y &>> $LOGFILE
    stat $?                         # Calling stat function which is declared above and $? will display the status (Success or failed) of the last command executed

echo -n "Downloading the component..."
    curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"
    stat $?

echo -n "Performing Cleanup..."
    rm -rf /usr/share/nginx/html/* &>> $LOGFILE
    stat $?

cd /usr/share/nginx/html
echo -n "Unzipping the $COMPONENT..."
    unzip /tmp/$COMPONENT.zip &>> LOGFILE
stat $?
mv $COMPONENT-main/* .
mv static/* .
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