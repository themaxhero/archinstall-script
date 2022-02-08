#!/bin/bash
pushd /tmp
wget https://de-2-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst
wget https://de-2-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst
wget https://download.sublimetext.com/sublimehq-pub.gpg
pacman -U chaotic-{keyring,mirrorlist}.pkg.tar.zst
pacman-key --lsign-key 8A8F901A
popd

sed -i -e "s/#Color/Color\nILoveCandy/" /etc/pacman.conf
pacman -Syu yay --no-confirm
sudo -H -u ${USERNAME} yay -Syu ${PACKAGES[@]} --answerclean All --answerdiff All

# Theming
mkdir -p /etc/sddm.conf.d
echo -e "[Theme]\nCurrent=${SDDM_THEME}" > /etc/sddm.conf.d/theme.conf
chmod 755 /usr/share/sddm/themes/aerial/
touch /etc/plymouth/plymouthd.conf

yes | pacman -Scc

cat <<PLYMOUTHEOF | tee -a /etc/plymouth/plymouthd.conf > /dev/null
[Daemon]
Theme=arch-logo
ShowDelay=5
PLYMOUTHEOF