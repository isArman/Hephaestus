# What is Hephaestus?
An Ansible playbook to automate the setup of Fedora, inspired by Hephaestus, the god of fire and craftsmanship. Streamline your Fedora experience with efficient configurations for a productive environment.

# Requirements:
1. Install ansible:
   ```
   sudo dnf install ansible -y
   sudo dnf install ansible-core -y
   ```
2. Change default repository (Optional, recommended for Iranian users):
   ```
   sudo wget -O etc/yum.repos.dt/iutfedora.repo http://repo.iut.ac.ir/repo/iutfedora.repo
   ```

3. Add localhost ssh key to use ansible:

```
ssh-keygen
sudo dnf install openssh-server
sudo systemctl enable --now sshd
mkdir ~/.ssh/authorized_keys ; cat id_*.pub > authorized_keys
```
# Quick Start:
```
ansible-playbook -i ./inventory ./playbook1.yml --ask-become-pass
```
