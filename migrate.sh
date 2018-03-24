#!/usr/bin/env bash

set -e
shopt -s extglob

DDL_FILES=$(ls $EFFECTIVE_SQL_SAMPLE_DEST/*Structure.sql)
DML_FILES=$(ls $EFFECTIVE_SQL_SAMPLE_DEST/!(*Structure).sql)

for f in $DDL_FILES; do
  echo $f
  mysql -u root < $f
done

for f in $DML_FILES; do
  echo $f
  mysql -u root < $f
done
