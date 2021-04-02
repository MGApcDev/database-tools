#!/bin/bash
source load-base-env.sh

echo 'export PATH="'${PWD}'/bin:$PATH"' >> "${HOME}/${BASH_PROFILE_PATH}"
