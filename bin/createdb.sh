#!/bin/bash

BASEDIR=$(dirname "$0")

FILE=.env
if [ -f "$FILE" ]; then
    source $BASEDIR/load-base-env.sh
    source $BASEDIR/load-env.sh

    echo "Creating database '${DB_DATABASE}' with user '${DB_USERNAME}'"

    MYSQL_PWD="${MYSQL_ROOT_PASSWORD}" mysql -h${DB_HOST} -u${MYSQL_ROOT_USERNAME} -e "create database ${DB_DATABASE}" && \
    echo "Database created"

    USER_EXISTS="$(MYSQL_PWD="${MYSQL_ROOT_PASSWORD}" mysql -u${MYSQL_ROOT_USERNAME} -sse "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = '$DB_USERNAME')")"
    if [ "$USER_EXISTS" = 1 ]; then
       echo "User already exist"
    else
       MYSQL_PWD="${MYSQL_ROOT_PASSWORD}" mysql -h${DB_HOST} -u${MYSQL_ROOT_USERNAME} -e "create user '${DB_USERNAME}'@'%' identified by '${DB_PASSWORD}'" && \
       echo "User created"
    fi

    MYSQL_PWD="${MYSQL_ROOT_PASSWORD}" mysql -h${DB_HOST} -u${MYSQL_ROOT_USERNAME} -e "grant all privileges on ${DB_DATABASE}.* to '${DB_USERNAME}'@'%'" && \
    MYSQL_PWD="${MYSQL_ROOT_PASSWORD}" mysql -h${DB_HOST} -u${MYSQL_ROOT_USERNAME} -e "flush privileges"
    echo "Permissions to user granted"
else
    echo "$FILE not found. Check you are in the correct directory."
fi
