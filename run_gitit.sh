#!/bin/bash
set -eu

(
    cd wikidata
    git pull
)

if [ -f pid-file ]; then
    kill -TERM $(cat pid-file)
    rm pid-file
    sleep 3
fi

nohup gitit -f ./gitit.conf >> stdout.log 2>> stderr.log &
echo $! > pid-file
