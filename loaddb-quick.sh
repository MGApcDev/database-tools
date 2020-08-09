#!/bin/bash

if [ "$1" == "" ] ; then
  echo 'usage: loaddb.sh <dumpfile.sql.gz>'
  exit
fi

source ~/database-tools/load-env.sh
source ~/database-tools/load-base-env.sh

BUILD_SQL_DUMP_NAME="$HOME/database-tools/aaa-dump--${DB_DATABASE}.sql.gz"
MYSQL_DUMP_OPTIONS="--set-gtid-purged=OFF --single-transaction --quick"

echo "Loading dump $1 ..."

cat ~/database-tools/drop-all-tables.sql | MYSQL_PWD="${DB_PASSWORD}" mysql -u${DB_USERNAME} ${DB_DATABASE}

gzcat $1 | MYSQL_PWD="${DB_PASSWORD}" mysql ${DB_DATABASE} -u ${DB_USERNAME}
