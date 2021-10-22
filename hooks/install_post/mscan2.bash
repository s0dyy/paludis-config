#!/usr/bin/env bash

exit 0

PKG=$(echo ${TARGET} | sed -E 's/-([0-9]+.*|scm):.*::.*$//')

if [[ $PKG == repository* ]]; then
        echo "Repository found, skipping hook"
        exit 0
fi

if [[ $PKG == user* ]]; then
        echo "user found, skipping hook"
        exit 0
fi

if [[ $PKG == group* ]]; then
        echo "Group found, skipping hook"
        exit 0
fi

echo "*******************************************************************"
echo "Dependencies I believe to have found for ${PKG} (excluding system):"

/home/s0dyy/Documents/gitlab-exherbo/exherbo-dev-tools/mscan2.rb -i system --hide-libs unused "${PKG}" 2>&1
