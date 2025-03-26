#!/bin/sh

if [ $(whoami) = "root" ]; then
	OUTPUT_TEST=$(nginx -t 2>&1)
else
	OUTPUT_TEST=$(sudo nginx -t 2>&1)
fi
RESULT_TEST=$?
OUTPUT_CHECK=$(echo -e "$OUTPUT_TEST" |tail --lines 1)

if [ $RESULT_TEST -eq 0 ]; then
	echo "OK - $OUTPUT_CHECK"
	exit 0
else
	echo "CRITICAL - $OUTPUT_CHECK"
	exit 2
fi

