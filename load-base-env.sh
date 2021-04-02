#!/bin/bash

BASEDIR=$(dirname "$0")

for a in $BASEDIR/.env ; do
  if [ -f $a ] ; then
    while IFS= read -r line ; do
      [ -z "`echo $line|grep -v '^#'`" ] && continue
      key=`echo $line|cut -d= -f1`
      value=`echo $line|cut -d= -f2-|sed "s/^[\"']//"|sed "s/[\"']$//"`
      export $key="$value"
    done < $a
  fi
done
