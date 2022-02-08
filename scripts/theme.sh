#!/bin/bash

cat <<EOF | tee ${SDDM_SERVICE} > /dev/null
[Unit]
Description=Simple Desktop Display Manager
Documentation=man:sddm(1) man:sddm.conf(5)
Conflicts=getty@tty1.service plymouth-quit.service
Wants=plymouth-deactivate.service
After=systemd-user-sessions.service getty@tty1.service plymouth-deactivate.service plymouth-quit.service
[Service]
ExecStart=/usr/bin/sddm
Restart=always
[Install]
Alias=display-manager.service
EOF