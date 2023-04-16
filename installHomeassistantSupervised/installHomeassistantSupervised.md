# Installation of Homeassistant Supervised
as described on: https://peyanski.com/how-to-install-home-assistant-supervised-official-way/


# Fundamental Add-ons
as described on: https://mathesonsteplock.ca/install-home-assistant-supervised-on-debian/

## Step 3: Post Install Steps
### 1. Install The SSH Add On

The SSH add on in Home Assistant allows you to access the Home Assistant command line interface which can be vary helpful for diagnosing issues with you Home Assistant install

    To install SSH head to the Supervisor tab
    Then click Add on Store
    Now find Terminal & SSH and Click install

Before starting you must set a password and change the port as port 22 is already used by the Host’s SSH server

So before you start the Addon head to the configuration tab and change the Port setting under Network and add a password. Be sure to save both these settings then you can start the add on

You should now be able to now SSH into your hassio instance using the command

ssh root@your.ip.address.here -p 29

### 2. Install SAMBA

SAMBA will allow you to access your configuration files from any PC on your local network

To install it simply

Find SAMBA share in the add on store

Edit the Configuration to to include your own username and password

Then save the config and start the add on

Now you should be able to access your files from any file manager on the network by typing

\\your.ip.address.here\

into your file browser

Your Home Assistant config files will be found in the config folder
