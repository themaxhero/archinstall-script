#!/bin/bash
locale-gen
hwclock --systohc
timedatectl set-ntp true

/install_script/user.sh
/install_script/packages.sh

sed -i -e 's/^#Port.+$/Port ${SSH_SERVER_PORT}/' /etc/ssh/sshd_config
sed -i -e 's/^HOOKS=.+$/HOOKS=(${MKINITCPIO_HOOKS[@]})/' /etc/mkinicpio.conf
mkinitcpio -Pv

# EFI Executable for Running Arch Vanilla (Kernel without Any Patch)
cat <<EOF | tee /etc/kesboot.conf > /dev/null
MICROCODE=amd-ucode.img
CMDLINES=(
'linux' '${KERNEL_PARAMS[@]}'
'linux-tkg-bmq-generic_v3' '${KERNEL_PARAMS[@]}'
)
EOF

# Create Entries for EFI Loaders
kesboot -u