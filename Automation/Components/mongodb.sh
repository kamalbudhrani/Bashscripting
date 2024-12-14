#!/bin/bash
set -e                          # This is used to break/stop the script execution if any command in the script does not complete with success

 # Veirfy the script is being executed with root user or not

 COMPONENT=mongodb

 source common.sh     # source is used to call the functions or expressions declared outside this script, like for this stat function and root priviledge expression are declared in common.sh script which is present outside this script inside Components folder, whatever functions or expressions declared in common.sh will be called when we use source command

#  echo -n "Configuring the repository..."
#     curl -s -o /etc/yum.repos.d/$COMPONENT.repo https://raw.githubusercontent.com/stans-robot-project/$COMPONENT/main/mongo.repo
#  stat $?

#  echo -n "Installing $COMPONENT..."
#     yum install mongodb-org -y &>> $LOGFILE
# stat $?

echo -n "Updating the mongodb configuration..."
    sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf   # The SED (Stream Editor) command in Unix/Linux is a powerful utility used to process and manipulate text in files. It can perform a variety of operations such as searching, find-and-replace, insertion, deletion, and more, without the need to open the file in an editor. This makes it a highly efficient tool for managing and editing text, especially when working with large files or automating tasks in scripts.
stat $?

echo -n "Starting $COMPONENT..."
    systemctl enable mongod &>> $LOGFILE
    systemctl start mongod &>> $LOGFILE
stat $?

echo -n "Downloading the $COMPONENT Schema..."
    curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip" &>> $LOGFILE
stat $?

echo -n "Injecting the Schema..."
    cd /tmp
    unzip -o mongodb.zip &>> $LOGFILE
    cd mongodb-main
    mongo < catalogue.js &>> $LOGFILE
    mongo < users.js &>> $LOGFILE
stat $?

# What I am planning to have?
# 1. If any step fail, I dont want to proceed further and want to break the script.
# 2. I want validation to happen first and then if it's a root or sudo user then only I want to run, if not I would like to break the script
# 3. I would like to add success/failure messages next to each instruction