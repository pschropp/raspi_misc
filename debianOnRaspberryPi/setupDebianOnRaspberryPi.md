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

## Optional: Set locale (only necessary when ssh from certain terminals)
not as root
```Bash
apt install -y locales
locale
```

## Use NetworkManager to configure connections
```Bash
sudo apt install network-manager  # usually already installed on Debian/Ubuntu
```

Wifi and/or ethernet connections that were used during installation have to be removed (or commented) from `/etc/network/interfaces`:
```Bash
sudo nano /etc/network/interfaces  # comment out everything
sudo nano /etc/NetworkManager/NetworkManager.conf  # set managed to false (=default)
sudo systemctl restart network-manager
```

## Share Internet to Ethernet Connection
```Bash
sudo nmcli connection modify type ethernet ifname <ethernet name> ipv4.method shared con-name local
# sudo nmcli connection modify local ipv4.addresses 192.168.42.1/24  # otpional, if not using default ip is required
sudo nmcli connection up local
```

## Optional: Install a Desktop Environment
Login as root or use sudo for commands

### Option 1
```Bash
sudo apt install tasksel -y
sudo tasksel install xfce-desktop
sudo reboot
```
Will display a window to select a desktop environment. (LXDE is light-weight and used for PiOS. xfce similarly ligh-weight but more extensive)

More desktop environments can be added by executing this command `tasksel` again. After a reboot, choose a user and there is a cog wheel to select the desktop environment.

### Option 2
if tasksel does not work:
```Bash
sudo apt install task-xfce-desktop
sudo reboot
```
select lightdm as display manager

### Set default boot target
```Bash
sudo systemctl get-default  # check
sudo systemctl set-default graphical.target  # set to graphical
# sudo systemctl set-default multi-user.target  # set to CLI
```

