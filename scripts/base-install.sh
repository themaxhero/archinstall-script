#!/bin/bash
pacstrap ${ROOT_MOUNT} base base-devel
mkdir -p ${ROOT_MOUNT}/install_script

cp ./scripts/user.sh ${ROOT_MOUNT}/install_script/user.sh
cp ./scripts/packages.sh ${ROOT_MOUNT}/install_script/packages.sh

arch-chroot ${ROOT_MOUNT} /bin/bash ./inner-install.sh

arch-chroot ${ROOT_MOUNT} /bin/bash <<EOF
rm -r /install_script
EOF

reboot