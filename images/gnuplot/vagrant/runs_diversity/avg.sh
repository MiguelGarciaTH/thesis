#!/usr/bin/env bash

half=1;

len=`cat $1 | grep "inserted: " | wc -l`;

cat  $1 | grep "inserted:" | tail -n $(($len/$half)) | awk '{ total += $4; count++ } END { print total/count }'
