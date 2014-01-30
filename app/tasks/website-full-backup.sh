#!/bin/bash
# website-full-backup.sh
#
# This file makes a complete backup of your production website.

# Include settings file.
THIS_DIR=$(dirname "$(readlink -fn "$0")")
SETTINGS=$THIS_DIR/website-settings.sh
. $SETTINGS

# Put your website in maintenance state.
sudo bash $THIS_DIR/website-switch.sh
# Backup your files.
sudo bash $THIS_DIR/website-backup-application.sh
# Backup your dtabase.
sudo bash $THIS_DIR/website-backup-database.sh
# Put your website back on its working state.
sudo bash $THIS_DIR/website-switch.sh
