#!/bin/bash

COMPONENT=Catalogue

source common.sh
APPUSER=roboshop

echo -n "Configuring Node JS ..."
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>> $LOGFILE
stat $?

echo -n "Installing Node JS ..."
yum install nodejs -y &>> $LOGFILE
stat $?

id $APPUSER &>> $LOGFILE
if [ $? -ne 0 ]; then
echo -n "Creating App User ..."
useradd $APPUSER &>> $LOGFILE
stat $?
fi

echo -n "Downloading the $COMPONENT ..."
curl -s -L -o /tmp/catalogue.zip "https://github.com/stans-robot-project/catalogue/archive/main.zip"
stat $?

echo -n "Moving $COMPONENT code to $APPUSER home directory ..."
cd /home/$APPUSER/
unzip -o /tmp/catalogue.zip &>> $LOGFILE
stat $?

echo -n "Performing Cleanup ..."
rm -rf 
mv $COMPONENT-main $COMPONENT
stat $?

echo -n "Installing Node JS dependencies ..."
cd $COMPONENT
npm install &>> $LOGFILE
stat $?

echo -n "Changing permissions to $APPUSER ..."
chown -R $APPUSER:$APPUSER /home/roboshop/$COMPONENT
stat $?

