#!/bin/bash

parted --script "${ROOT_PART}" -- \
  mklabel gpt \
  mkpart ESP fat32 1Mib ${BOOT_SIZE} \
  mkpart primary ext4 ${BOOT_SIZE} 100%

mkfs.vfat -F 32 $BOOT_PART
mkfs.ext4 $ROOT_PART

mount $ROOT_PART $ROOT_MOUNT
mkdir -p $BOOT_MOUNT
mount $BOOT_PART $BOOT_MOUNT

export ROOT_UUID=$(blkid -s UUID -o value $ROOT_MOUNT)
export BOOT_UUID=$(blkid -s UUID -o value $BOOT_MOUNT)

genfstab -U ${ROOT_MOUNT} > ${ROOT_MOUNT}/etc/fstab
