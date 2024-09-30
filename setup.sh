#!/bin/bash

# Change the default repository to iutfedora repository to bypass restrictions.
sudo sed -i 's/enabled=1/enabled=0/g' "/etc/yum.repos.d/"/*
sudo cp ./iutfedora.repo /etc/yum.repos.d/.
sudo dnf update -y

# 