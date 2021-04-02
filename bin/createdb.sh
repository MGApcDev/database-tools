#!/bin/bash

BASEDIR=$(dirname "$0")

source $BASEDIR/../load-env.sh
source $BASEDIR/../load-base-env.sh

echo "Creating database ${DB_DATABASE} with user ${DB_USERNAME} ..."


mysql -h${DB_HOST} -u${MYSQL_ROOT} -e "create database ${DB_DATABASE}" && \
mysql -h${DB_HOST} -u${MYSQL_ROOT} -e "create user '${DB_USERNAME}'@'%' identified by '${DB_PASSWORD}'" && \
mysql -h${DB_HOST} -u${MYSQL_ROOT} -e "grant all privileges on ${DB_DATABASE}.* to '${DB_USERNAME}'@'%'" && \
mysql -h${DB_HOST} -u${MYSQL_ROOT} -e "flush privileges"

# log "Created database ${DB_DATABASE} with user ${DB_USERNAME}"
