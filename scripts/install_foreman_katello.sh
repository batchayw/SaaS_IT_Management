#!/bin/bash
yum install -y foreman-installer
foreman-installer --enable-foreman-plugin-katello
systemctl start foreman
systemctl enable foreman