#!/bin/sh

PROFILE_DIR=$(dirname ~/.var/app/org.mozilla.firefox/.mozilla/firefox/*/updater.sh)

cd $PROFILE_DIR

./updater.sh
./prefsCleaner.sh
