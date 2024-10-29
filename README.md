# What is Hephaestus?
Hephaestus is a setup script designed to optimize and automate the configuration of Fedora for a smooth and productive experience. Named after the god of fire and craftsmanship, Hephaestus brings efficient configurations and essential tools to supercharge your Fedora environment, tailored for ease of use in restricted regions.

# Key Features

Repository Setup: Disables the default repositories and enables the IUT Fedora repository to bypass restrictions.
Network Optimization: Updates the network status endpoint to resolve connectivity issues from Iran.
Essential Package Installation: Quickly installs necessary tools including vim, zsh, docker, golang, vlc, and ffmpeg for an enhanced working environment.
Docker Configuration: Enables the Docker service and installs the v2rayA proxy tool for network tunneling, accessible via localhost:2017.
Communication & Development Tools: Installs popular applications like Telegram and Visual Studio Code through custom repositories.
Oh-My-Zsh Setup: Configures the robust Oh-My-Zsh framework for managing your Zsh configuration with a vast array of community plugins and themes.

# Requirements

Fedora 40: Tested and optimized for the latest version of Fedora.
Internet Access: Required for initial setup and package installations.

# Usage
1. Clone the Hephaestus repository:
```
git clone https://github.com/isArman/Hephaestus.git
```
2. git clone https://github.com/isArman/Hephaestus.git
```
cd Hephaestus
```
3. Run the setup script:
```
./setup.sh
```
4. Reboot your system after the setup completes to apply all changes.

# Post-Installation Setup
Docker and v2rayA are now installed and configured. Access v2rayA by visiting http://localhost:2017 on your browser.
Open a new terminal session to start using Oh-My-Zsh.