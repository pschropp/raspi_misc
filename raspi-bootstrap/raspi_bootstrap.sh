#!/bin/bash
# Raspi Setup script 11/2021
# $Author: passl $
# $Revision: 0.1 $

# how to use: make executable:
#sudo chmod +x raspi-bootstrap.sh
# execute script
#./raspi-bootstrap.sh

sudo passwd pi

# update firmware
sudo SKIP_WARNING=1 rpi-update
# expand filesystem on next reboot (automatically done on first boot)
#sudo raspi-config nonint do_expand_rootfs 1

# deactivate splashscreen
sudo raspi-config nonint do_boot_splash 0
# change to Desktop with login
sudo raspi-config nonint do_boot_behaviour B3
# disable overscan
sudo raspi-config nonint do_overscan 1
# set GPU memory split
sudo raspi-config nonint do_memory_split 128
# set timezone
sudo timedatectl set-timezone Europe/Berlin
# configure keyboard
sudo raspi-config nonint do_configure_keyboard de
# activate vnc server
sudo raspi-config nonint do_vnc 1

sudo apt-get update && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y

sudo apt-get -y install screen

echo "Installing Docker"
curl -sSL https://get.docker.com | sh
echo "Finishing docker setup"
sudo usermod -aG docker pi

# install portainer docker
sudo docker pull portainer/portainer-ce:latest
sudo docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

# install nextcloudpi docker
docker pull ownyourbits/nextcloudpi
docker run -d -p 4443:4443 -p 443:443 -p 80:80 -v ncdata:/data --name nextcloudpi ownyourbits/nextcloudpi 192.168.178.10
docker update --restart=unless-stopped nextcloudpi

sudo apt-get install kodi

sudo reboot
