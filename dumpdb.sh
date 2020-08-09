#!/bin/bash

source ~/database-tools/load-env.sh
source ~/database-tools/load-base-env.sh

if [ "$1" == "" ] ; then
  BUILD_SQL_DUMP_NAME="${DB_DATABASE}--`date "+%Y%m%d-%H%M%S"`.sql.gz"
else
  BUILD_SQL_DUMP_NAME="${1}--`date "+%Y%m%d-%H%M%S"`.sql.gz"
fi

MYSQL_DUMP_OPTIONS="--set-gtid-purged=OFF --single-transaction --quick"

echo "Dumping database ${BUILD_SQL_DUMP_NAME}"

MYSQL_PWD="${DB_PASSWORD}" mysqldump ${MYSQL_DUMP_OPTIONS} -u ${DB_USERNAME} ${DB_DATABASE} | gzip > ${BUILD_SQL_DUMP_NAME}
