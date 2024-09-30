#!/bin/bash

# Change the default repository to iutfedora repository to bypass restrictions.
sudo sed -i 's/enabled=1/enabled=0/g' "/etc/yum.repos.d/"/*
sudo cp ./iutfedora.repo /etc/yum.repos.d/.
sudo dnf update -y

# Modify the default network status endpoint to bypass access issues from Iran.
sudo cp ./90-connectivity.conf /etc/NetworkManager/conf.d/.

# Install some packages there are in dnf repository
sudo dnf install vim zsh docker

# enable docker
sudo systemctl enable --now docker.service

# Install v2rayA using docker (It's accesible in localhost:2017)
sudo docker pull docker.arvancloud.ir/mzz2017/v2raya
sudo docker tag docker.arvancloud.ir/mzz2017/v2raya mzz2017/v2raya
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

# Setup oh-my-zsh! (a delightful, open source, community-driven framework for managing your Zsh configuration)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

