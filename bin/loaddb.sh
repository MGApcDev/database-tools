#!/bin/bash

if [ "$1" == "" ] ; then
  echo 'usage: loaddb.sh <dumpfile.sql.gz>'
  exit
fi

BASEDIR=$(dirname "$0")

FILE=.env
if [ -f "$FILE" ]; then
  source $BASEDIR/load-env.sh
  source $BASEDIR/load-base-env.sh

  MYSQL_DUMP_OPTIONS="--set-gtid-purged=OFF --single-transaction --quick"

  echo "Loading to database '${DB_DATABASE}' as user '${DB_USERNAME}'"
  echo "Dropping all tables"

  cat ~/database-tools/drop-all-tables.sql | MYSQL_PWD="${DB_PASSWORD}" mysql -u${DB_USERNAME} ${DB_DATABASE}

  echo "Loading dump $1 ..."
  gzcat $1 | MYSQL_PWD="${DB_PASSWORD}" mysql ${DB_DATABASE} -u ${DB_USERNAME}
else
  echo "$FILE not found. Check you are in the correct directory."
fi
