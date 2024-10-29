#!/bin/bash

GREEN='\033[0;32m'

# Disable all of repositories
for file in /etc/yum.repos.d/*; do
    sudo sed -i 's/^enabled=1$/enabled=0/' "$file"
done

# Enable IUT repository
sudo cp ./conf/iut.repo /etc/yum.repos.d/.
echo -e "${GREEN}1. Default repository changed successfully.${NC}"

# Modify the default network status endpoint to bypass access issues from Iran.
sudo cp ./conf/90-connectivity.conf /etc/NetworkManager/conf.d/.
echo -e "${GREEN}2. Default network status endpoint changed successfully.${NC}"

# Download nececary packages
sudo dnf install dnf-utils vim zsh docker transmission okular vlc vlc-cli gcc-go golang-bin unzip ffpmeg -y
echo -e "${GREEN}3. All of requested packages has been installed.${NC}"

# Enable docker
sudo systemctl enable --now docker.service
echo -e "${GREEN}4. Docker service enabled successfully.${NC}" 

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
echo -e "${GREEN}5. v2rayA is accessible at http://localhost:2017 .${NC}"

# Install Telegram
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install telegram
echo -e "${GREEN}6. Telegram installation completed successfully.${NC}"

# Install vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
sudo dnf check-update -y
sudo dnf install code -y # or code-insiders
echo -e "${GREEN}7. vscode installation completed successfully.${NC}"

# Setup oh-my-zsh! (a delightful, open source, community-driven framework for managing your Zsh configuration)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo -e "${GREEN}oh-my-zsh set up successfully.${NC}"