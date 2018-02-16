#!/bin/bash

cd /opt/firebird3/

echo "Setting SYSDBA's password..."

FIREBIRD_PASSWORD=${FIREBIRD_PASSWORD:-"masterkey"}
IBASE_PASSWORD=`grep -Po '(?<=ISC_PASSWORD=)[^\s]*' ./SYSDBA.password`

./bin/fbguard &

sleep 5

echo "alter user sysdba set password '${FIREBIRD_PASSWORD}';" | ./bin/isql \
    -u sysdba -p ${IBASE_PASSWORD} security3.fdb

pkill fbguard

echo "Starting Firebird..."

./bin/fbguard