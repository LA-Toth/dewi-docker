#!/usr/bin/env bash

VERSIONED_DIRS=$(ls -d *.x)

for i in ${VERSIONED_DIRS[@]}; do
  (
    cd $i &&
      {
        if test -e build.sh; then
          ./build.sh
        else
          ../current/build.sh
        fi
      }
  )
done

(cd latest && ../current/build.sh)
