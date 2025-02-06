#!/bin/bash

file="backup.list"

if [[ -f $file ]]; then
    mapfile -t DIRECTORIES < "$file"
else
    echo "Error: File $file not found!" >&2
    exit 1
fi

DESTINATION_DIR=.

DATE=$(date +"%Y%m%d")

ARCHIVE_NAME="backup${DATE}.tar"

tar -cf "$DESTINATION_DIR/$ARCHIVE_NAME" ${DIRECTORIES[@]}

if [ $? -eq 0 ]; then
  echo "Backup successful : $DESTINATION_DIR/$ARCHIVE_NAME"
else
  echo "Backup failed"
  exit 1
fi

exit 0
