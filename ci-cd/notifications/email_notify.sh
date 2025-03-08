#!/bin/bash
MESSAGE="$1"
SUBJECT="Notification"
TO="admin@example.com"
echo "$MESSAGE" | mail -s "$SUBJECT" "$TO"