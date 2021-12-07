#!/usr/bin/env bash

VERSIONED_DIRS=$(ls -d *.x)

for i in "${VERSIONED_DIRS[@]}"; do
  (
    cd $i &&
      {
        if test -e push.sh; then
          ./push.sh
        else
          ../current/push.sh
        fi
      }
  )
done

(cd latest && ../current/push.sh)
