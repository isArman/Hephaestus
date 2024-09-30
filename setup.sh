#!/bin/bash

# Change the default repository to iutfedora repository to bypass restrictions.
sed -i 's/enabled=1/enabled=0/g' "/etc/yum.repos.d/"/*
sudo cp ./iutfedora.repo /etc/yum.repos.d/.
sudo update -y
