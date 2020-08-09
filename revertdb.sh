#!/bin/bash

source ~/database-tools/load-env.sh
source ~/database-tools/load-base-env.sh

cat ~/database-tools/drop-all-tables.sql | MYSQL_PWD="${DB_PASSWORD}" mysql -h${DB_HOST} -u${DB_USERNAME} ${DB_DATABASE}

FILE=~/database-tools/aaa-dump--${DB_DATABASE}.sql.gz
if [ -f "$FILE" ]; then
    echo "Loading reverting to old dump ..."
    gzcat ${FILE} | MYSQL_PWD="${DB_PASSWORD}" mysql ${DB_DATABASE} -u ${DB_USERNAME}
else
    echo "Backup file does not exist."
fi

