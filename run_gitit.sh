#!/bin/bash
set -eu

(
    cd wikidata
    git pull
    git checkout develop
)

exec nohup gitit -f ./gitit.conf >> stdout.log 2>> stderr.log &
