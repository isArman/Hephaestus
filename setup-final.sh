#!/bin/bash

# Disable all of repositories
for file in /etc/yum.repos.d/*; do
    sudo sed -i 's/^enabled=1$/enabled=0/' "$file"
done

# Enable IUT repository
sudo cp ./conf/iut.repo /etc/yum.repos.d/.
