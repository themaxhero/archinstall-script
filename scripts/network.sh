#!/bin/bash

echo -e $HOSTNAME | cp /dev/stdin "${ROOT_MOUNT}/etc/hostname" > /dev/null

export HOSTS=${ROOT_MOUNT}/etc/hosts

cat <<EOF | tee "${HOSTS}" > /dev/null
127.0.0.1 localhost
::1 localhost
127.0.1.1 ${HOSTNAME}.localdomain ${HOSTNAME}
EOF
