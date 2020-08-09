#!/bin/bash
source ~/database-tools/load-base-env.sh

echo 'alias '${LOAD_COMMAND}'="~/database-tools/loaddb.sh"' >> "${HOME}/${PROFILE_PATH}"
echo 'alias '${DUMP_COMMAND}'="~/database-tools/dumpdb.sh"' >> "${HOME}/${PROFILE_PATH}"
echo 'alias '${QUICKLOAD_COMMAND}'="~/database-tools/loaddb-quick.sh"' >> "${HOME}/${PROFILE_PATH}"
echo 'alias '${REVERT_COMMAND}'="~/database-tools/revertdb.sh"' >> "${HOME}/${PROFILE_PATH}"

