#!/bin/bash
#clean temporary files older than a specified number of days

DIR="/tmp"
DAYS=7

echo "Cleaning up files in $DIR older than $DAYS days..."
find $DIR -type f -mtime +$DAYS -exec rm -f {} \;
echo "Cleanup completed."