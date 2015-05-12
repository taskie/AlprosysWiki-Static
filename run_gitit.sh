#!/bin/bash
set -eu

(
    cd wikidata
    git pull
    git checkout develop
)

PATH=.cabal-sandbox/bin/:"$PATH"
exec nohup gitit -f ./gitit.conf >> stdout.log 2>> stderr.log &
