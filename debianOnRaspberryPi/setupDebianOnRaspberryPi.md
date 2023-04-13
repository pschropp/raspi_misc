# Setup and pre-configure Debian on RaspberryPi

inspred by: https://raspberrytips.com/install-debian-on-raspberry-pi/

execute script after flashing image to SDcard and starting Pi and either
  - connecting it to ethernet
  - connecting it to a screen and a keyboard

## Add Wifi
```Bash
nano /etc/network/interfaces.d/wlan0
```

![image](https://user-images.githubusercontent.com/30534845/231862066-77061838-b0b0-4e6c-941b-b9fd6e143208.png)

```Bash
reboot
```

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
