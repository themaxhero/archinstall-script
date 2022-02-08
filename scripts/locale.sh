#!/bin/bash
cat <<EOF | cp /dev/stdin ${ROOT_MOUNT}/etc/locale.conf
LANG=${LOCALES[0]}.UTF-8
LANGUAGE=$(join_by : ${LOCALES[@]})
EOF

chmod 644 "${ROOT_MOUNT}/etc/locale.conf"
ln -sf "/usr/share/zoneinfo/${TIMEZONE}" "/etc/localtime"
ln -sf "${ROOT_MOUNT}/usr/share/zoneinfo/${TIMEZONE}" "${ROOT_MOUNT}/etc/localtime"

echo -e "KEYMAP=${KEYBOARD_LAYOUT}" | cp /dev/stdin "${ROOT_MOUNT}/etc/vconsole.conf"