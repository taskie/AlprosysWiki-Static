#!/bin/bash
set -eu

(
    cd wikidata
    git pull
)

exec nohup gitit -f ./gitit.conf >> stdout.log 2>> stderr.log &
