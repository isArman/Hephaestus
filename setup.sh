#!/bin/bash

# Change the default repository to iutfedora repository to bypass restrictions.
sudo sed -i 's/enabled=1/enabled=0/g' "/etc/yum.repos.d/"/*
sudo cp ./iutfedora.repo /etc/yum.repos.d/.
sudo dnf update -y

# Modify the default network status endpoint to bypass access issues from Iran.
sudo cp ./90-connectivity.conf /etc/NetworkManager/conf.d/.
