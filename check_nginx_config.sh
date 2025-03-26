#!/bin/sh

OUTPUT=$(nginx -t 2>&1 |tail --lines 1)
RESULT=$?

if [ $RESULT -eq 0 ]; then
	echo "OK - $OUTPUT"
	exit 0
else
	echo "CRITICAL - $OUTPUT"
	exit 2
fi

