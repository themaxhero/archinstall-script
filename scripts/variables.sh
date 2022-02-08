#!/bin/bash
export USERNAME=maxhero
export HOSTNAME=maxhero-workstation
export ROOT_PART=/dev/nvme0n1p2
export ROOT_MOUNT=/mnt
export BOOT_SIZE=512Mib
export BOOT_DISK=/dev/nvme0p1
export BOOT_PART=/dev/nvme0n1p1
export BOOT_MOUNT=${ROOT_MOUNT}/boot/efi
export TIMEZONE="America/Sao_Paulo"
export KEYBOARD_LAYOUT="br-abnt2"
export LOCALES=("en_US" "ja_JP" "pt_BR")
export SSH_SERVER_PORT=49970
export DEFAULT_KERNEL="linux-tkg-bmq-generic_v3"
export MKINITCPIO_HOOKS=(
  "base"
  "udev"
  "plymouth"
  "autodetect"
  "keyboard"
  "keymap"
  "modconf"
  "block"
  "lvm2"
  "filesystems"
  "fsck"
)
export KERNEL_PARAMS=(
  "rw"
  "initrd=\initramfs-linux.img"
  "quiet"
  "splash"
  "rd.udev.log_priority=3"
  "vt.global_cursor_default=0"
  "systemd.unified_cgroup_hierarchy=1"
  "modprobe.blacklist=radeon"
  "module_blacklist=radeon"
  "initrd=\amd-ucode.img"
  "loglevel=3"
  "amd_iommu=on"
  "iommu=pt"
)

export SERVICES=(
  "NetworkManager"
  "sddm-plymouth"
  "sshd"
)

export SDDM_THEME=aerial
export KDE_THEME=Orchis-dark
export GTK_THEME=Orchis-dark
export SDDM_SERVICE=${ROOT_MOUNT}/etc/systemd/system/sddm-plymouth.service
export PACKAGES=(
  xdg-{desktop-portal{,-wlr},user-dirs,utils}
  aur/aic94xx-firmware
  aur/wd719x-firmware
  yay
  adobe-source-han-{sans,serif}-{jp,kr}-fonts
  alacritty
  alsa-{firmware,utils}
  amd-ucode
  android-{tools,udev}
  brave
  chaotic-{keyring,mirror}
  orchis-theme-git
  orchis-kde-theme-git
  clipman
  conky
  network-manager
  dbeaver
  deluge-gtk
  dina-font
  discord-canary
  dina-font
  wofi
  ttf-{dejavu,fantasque-sans-mono,fira-sans,hanazono,liberation,opensans,sazanami,scientifica}
  sway{,bg,lock}
  steam-native-runtime
  sddm{,-theme-aerial-git}
  rsync
  openssh
  sshfs
  mpv
  wlrobs-hg
  wxgtk2
  minecraft-launcher
  xorg-xwayland
  calibre
  conky
  coreutils
  discord-canary
  dosfstools
  efibootmgr
  electron
  emacs
  file-roller
  firefox-wayland-hg
  flex
  gawk
  vim
  neovim
  git
  gimp
  glibc
  gparted
  gstreamer-meta
  gvfs{,-afc,-gphoto2,-mtp,-nfs,-smb}
  gzip
  htop
  ibus{,-anthy}
  inetutils
  nmap
  input-devices-support
  virt-manager-meta
  inxi
  iputils
  isync
  jfsutils
  jq
  js-beautify
  kodi-wayland
  kvantum-{qt5,theme-materia}
  lhasa
  wine-meta
  dxvk-mingw-git
  protontricks-git
  {,lib32-}gamemode
  {,lib32-}mangohud
  lutris
  pipewire{-pulse,-alsa,-jack}
  lib32-pipewire{,-jack}
  steam
  steam-native-runtime
  linux{,-headers,-firmware,-tkg-bmq-generic_v3{,-headers}}
  looking-glass
  looking-glass-host
  looking-glass-module-dkms
  lutris-git
  mako
  mangohud
  mkinitcpio-nfs-utils
  mkinitcpio-openswap
  mkinitcpio-systemd-tool
  mono
  mpv
  mtools
  mu
  tldr
  neofetch
  neovim-nightly-git
  noto-fonts{,-emoji}
  ntfs-3g
  obs-plugin-looking-glass
  obs-studio-wayland-git
  openssl-1.0
  orchis-theme-git
  os-prober
  osu-lazer
  otf-ipafont
  p7zip
  pacman-contrib
  pasystray
  pavucontrol
  pciutils
  playerctl
  plymouth-git
  aur/plymouth-theme-arch-logo
  podman
  podman-compose-git
  podman-docker
  popsicle-git
  postman-bin
  powerpill
  powertop
  procps-ng
  protontricks-git
  psmisc
  purescript-bin
  qbittorrent
  qemu
  qjackctl
  qt5-multimedia
  qt5-xcb-private-headers
  qt5ct
  qt6-wayland
  reflector
  ripgrep
  rsync
  ruby{,-irb,-reline}
  scientifica-bdf
  sddm
  sddm-theme-aerial-git
  slack-desktop
  slurp
  sof-firmware
  sshfs
  stylelint
  subversion
  tar
  teamviewer
  tela-circle-icon-theme-git
  telegram-desktop
  terminus-font
  tex-info
  tree
  un{archiver,rar,zip}
  usbutils
  util-linux
  wdisplays
  whatsapp-nativefier
  wine-lol
  wine-meta
  wine-tkg-staging-fsync-git
  wofi
  xcb-util-xrm
  xclip
  xz
  yaup-git
  zip
  ncurses
  glu
  wxgtk2
  libpng
  libssh
  unixodbc
)