#!/bin/bash

groupmod -g 10 wheel
groupmod -g 100 users
useradd -u 1000 --create-home -g users --groups wheel ${USERNAME}
echo -e "${ROOT_PASSWORD}\n${ROOT_PASSWORD}" | passwd root
echo -e "${PASSWORD}\n${PASSWORD}" | passwd ${USERNAME}

chsh root -s /bin/bash
chsh ${USERNAME} -s /bin/bash

usermod \
	-aG audio \
	-aG video \
	-aG input \
	-aG kvm \
  -aG docker \
	${USERNAME}

cat <<SUDOERSAPPEND | tee -a /etc/sudoers > /dev/null
%wheel ALL=(ALL) NOPASSWD: ALL
Defaults env_reset,pwfeedback
SUDOERSAPPEND
