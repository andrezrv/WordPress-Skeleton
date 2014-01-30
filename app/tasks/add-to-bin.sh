#!/bin/bash
# add-to-bin.sh
#
# Add scripts to /usr/bin

# Include settings file.
THIS_DIR=$(dirname "$(readlink -fn "$0")")
SETTINGS=$THIS_DIR/website-settings.sh
. $SETTINGS

# Make symlinks from /usr/bin to tasks within tasks folder.
# 
if [[ -L /usr/bin/$USR_BIN_PREFIX-backup-application ]]; then
	sudo rm /usr/bin/$USR_BIN_PREFIX-backup-application > /dev/null
fi
sudo ln -s $THIS_DIR/website-backup-application.sh /usr/bin/$USR_BIN_PREFIX-backup-application

if [[ -L /usr/bin/$USR_BIN_PREFIX-backup-database ]]; then
	sudo rm /usr/bin/$USR_BIN_PREFIX-backup-database > /dev/null
fi
sudo ln -s $THIS_DIR/website-backup-database.sh /usr/bin/$USR_BIN_PREFIX-backup-database

if [[ -L /usr/bin/$USR_BIN_PREFIX-full-backup ]]; then
	sudo rm /usr/bin/$USR_BIN_PREFIX-full-backup > /dev/null
fi
sudo ln -s $THIS_DIR/website-full-backup.sh /usr/bin/$USR_BIN_PREFIX-full-backup

if [[ -L /usr/bin/$USR_BIN_PREFIX-switch ]]; then
	sudo rm /usr/bin/$USR_BIN_PREFIX-switch > /dev/null
fi
sudo ln -s $THIS_DIR/website-switch.sh /usr/bin/$USR_BIN_PREFIX-switch
