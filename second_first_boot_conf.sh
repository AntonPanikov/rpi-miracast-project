#!/usr/bin/env bash

# Initial setup, should be executed after first boot
#
# Optionally first run `sudo raspi-conf` and change Locale and Timezone

# Chnage default `raspberry` password
echo "Change default use password:"
passwd



# Clean up apt cache
sudo apt clean
