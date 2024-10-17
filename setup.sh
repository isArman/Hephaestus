#!/bin/bash

GREEN='\033[0;32m'

# Change the default repository to iutfedora repository to bypass restrictions.
if [ -f /etc/yum.repos.d/iutfedora.repo ]; then
    sudo rm /etc/yum.repos.d/iutfedora.repo
fi
sudo sed -i 's/enabled=1/enabled=0/g' "/etc/yum.repos.d/"/*
sudo cp ./conf/iutfedora.repo /etc/yum.repos.d/.
sudo dnf upgrade -y

echo -e "${GREEN}Default repository changed successfully.${NC}"

# Modify the default network status endpoint to bypass access issues from Iran.
sudo cp ./conf/90-connectivity.conf /etc/NetworkManager/conf.d/.
echo -e "${GREEN}Default network status endpoint changed successfully.${NC}"

# Install some packages there are in dnf repository
sudo dnf install vim zsh docker transmission okular vlc vlc-cli gcc-go golang-bin unzip -y
echo -e "${GREEN}Packages installed successfully.${NC}"

# Install movie deacoder:
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-40.noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-40.noarch.rpm
dnf install gstreamer1-devel gstreamer1-plugins-base-tools gstreamer1-doc gstreamer1-plugins-base-devel gstreamer1-plugins-good gstreamer1-plugins-good-extras gstreamer1-plugins-ugly-free gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free-devel gstreamer1-plugins-bad-free-extras

# enable docker
sudo systemctl enable --now docker.service
echo -e "${GREEN}Docker service enabled successfully.${NC}"

# Install v2rayA using docker (It's accesible in localhost:2017)
sudo docker pull focker.ir/mzz2017/v2raya
sudo docker tag focker.ir/mzz2017/v2raya mzz2017/v2raya
sudo docker run -d \
  --restart=always \
  --privileged \
  --network=host \
  --name v2raya \
  -e V2RAYA_LOG_FILE=/tmp/v2raya.log \
  -e V2RAYA_V2RAY_BIN=/usr/local/bin/v2ray \
  -e V2RAYA_NFTABLES_SUPPORT=off \
  -e IPTABLES_MODE=legacy \
  -v /lib/modules:/lib/modules:ro \
  -v /etc/resolv.conf:/etc/resolv.conf \
  -v /etc/v2raya:/etc/v2raya \
  mzz2017/v2raya
echo -e "${GREEN}v2rayA is accessible at http://localhost:2017 .${NC}"

# Install Telegram
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install telegram
echo -e "${GREEN}Telegram installation completed successfully.${NC}"

# Install vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
sudo dnf check-update -y
sudo dnf install code -y # or code-insiders
echo -e "${GREEN}vscode installation completed successfully.${NC}"

# Setup oh-my-zsh! (a delightful, open source, community-driven framework for managing your Zsh configuration)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo -e "${GREEN}oh-my-zsh set up successfully.${NC}"

