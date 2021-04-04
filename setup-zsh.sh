#!/bin/bash
source bin/load-base-env.sh

echo 'export PATH="'${PWD}'/bin:$PATH"' >> "${HOME}/${ZSH_PROFILE_PATH}"
