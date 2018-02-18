#!/bin/bash
if (( `ulimit -n` < 8192 )); then
	ulimit -n 8192
fi
if [ "$TIMEZONE" ]; then
    if [ -f /usr/share/zoneinfo/$TIMEZONE ]; then
        rm -f /etc/localtime
        ln -s /usr/share/zoneinfo/$TIMEZONE /etc/localtime
    fi
fi
/opt/firebird/bin/fbguard -daemon
tail -F /opt/firebird/firebird.log
