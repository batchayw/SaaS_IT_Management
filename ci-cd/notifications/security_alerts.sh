#!/bin/bash
MESSAGE="Security alert: $1"
./ci-cd/notifications/slack_notify.sh "$MESSAGE"
./ci-cd/notifications/email_notify.sh "$MESSAGE"