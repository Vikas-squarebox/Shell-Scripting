#!/bin/bash
#clean temporary files older than a specified number of days
#owner: Vikas/Devops
#version: v0.0.1

DIR="/tmp"
DAYS=9

echo "Cleaning up files in $DIR older than $DAYS days..."
find $DIR -type f -mtime +$DAYS -exec rm -f {} \;
echo "Cleanup completed."