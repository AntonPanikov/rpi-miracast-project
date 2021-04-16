#!/usr/bin/env bash

# Exec from /boot partition of SD after writting new image

current_dir_name=${PWD##*/}

if [ "$current_dir_name" != "boot" ]; then
    >&2 echo "You are not in the boot folder of SD. You should run it from '/boot' of SD."
    exit 1
fi

# Enables SSH
touch ssh

# Configure WiFi

wifi_name=""      # <===== Change here
wifi_pass=""      # <===== Change here
wifi_country="US" # <===== Change here

cat > wpa_supplicant.conf << EOL
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=${wifi_country}

network={
    ssid="${wifi_name}"
    scan_ssid=1
`wpa_passphrase ${wifi_name} ${wifi_pass} | grep "[^#]psk=.*"`
}
EOL

