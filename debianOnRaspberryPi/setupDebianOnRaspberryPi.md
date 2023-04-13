# Setup and pre-configure Debian on RaspberryPi

inspred by: https://raspberrytips.com/install-debian-on-raspberry-pi/

execute script after flashing image to SDcard and starting Pi and either
  - connecting it to ethernet
  - connecting it to a screen and a keyboard

## Login as root
pwd: root

## Add Wifi
```Bash
nano /etc/network/interfaces.d/wlan0
```

![image](https://user-images.githubusercontent.com/30534845/231862066-77061838-b0b0-4e6c-941b-b9fd6e143208.png)

```Bash
reboot
```

## 

## Update and Upgrade
Once rebooted and connected to wifi update and upgrade

```Bash
apt update
apt upgrade -y
```

## Configure the Keyboard
```Bash
apt install keyboard-configuration
dpkg-reconfigure keyboard-configuration

#apt install console-setup
#setupcon
```

## Add User And make sudoer
```Bash
apt install sudo
adduser pi
/sbin/usermod -aG sudo pi
```

## Change Root Password
```Bash
passwd
```

```Bash
reboot
```

## Set locale
not as root
```Bash
apt install -y locales
locale
```

## Install a Desktop Environment
Login as root or use sudo for commands

```Bash
tasksel
```
Will display a window to select a desktop environment. (LXDE is light-weight and used for PiOS)

More desktop environments can be added by executing this command `tasksel` again. After a reboot, choose a user and there is a cog wheel to select the desktop environment.

if tasksel does not work:
```Bash
sudo apt install lxde task-lxde-desktop -y
```
