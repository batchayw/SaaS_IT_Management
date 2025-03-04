#!/bin/bash
systemctl start firewalld
systemctl enable firewalld
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --add-port=443/tcp --permanent
firewall-cmd --add-port=22/tcp --permanent
firewall-cmd --reload