# Installation
install HassOS image using Raspberry Pi Imager or balena etcher. Hook up display and keyboard to raspi, power up. 

# Log into host console
When CLI is ready, type 
```Bash
login
```
to get to the host console.

# Execute commands on host
now you can use `nmcli`.

# Connect to wifi
```Bash
nmcli device wifi connect "YOUR_SSID" password "YOUR_WIFI_PASSWORD"
```
