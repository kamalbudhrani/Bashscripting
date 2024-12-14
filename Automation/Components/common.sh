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
    fi
}