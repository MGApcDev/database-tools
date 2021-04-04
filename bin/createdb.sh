#!/bin/bash

BASEDIR=$(dirname "$0")

FILE=.env
if [ -f "$FILE" ]; then
    source $BASEDIR/load-base-env.sh
    source $BASEDIR/load-env.sh

    echo "Creating database '${DB_DATABASE}' with user '${DB_USERNAME}'"


    mysql -h${DB_HOST} -u${MYSQL_ROOT} -e "create database ${DB_DATABASE}" && \
    echo "Database created"

    USER_EXISTS="$(mysql -u${MYSQL_ROOT} -sse "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = '$DB_USERNAME')")"
    if [ "$USER_EXISTS" = 1 ]; then
        echo "User already exist"
    else
        mysql -h${DB_HOST} -u${MYSQL_ROOT} -e "create user '${DB_USERNAME}'@'%' identified by '${DB_PASSWORD}'" && \
        echo "User created"
    fi

    mysql -h${DB_HOST} -u${MYSQL_ROOT} -e "grant all privileges on ${DB_DATABASE}.* to '${DB_USERNAME}'@'%'" && \
    mysql -h${DB_HOST} -u${MYSQL_ROOT} -e "flush privileges"
    echo "Permissions to user granted"
else
    echo "$FILE not found. Check you are in the correct directory."
fi
