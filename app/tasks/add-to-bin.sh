#!/bin/bash
# add-to-bin.sh
#
# Add scripts to /usr/bin

# Include settings file.
THIS_DIR=$(dirname "$(readlink -fn "$0")")
SETTINGS=$THIS_DIR/website-settings.sh
. $SETTINGS

# Make symlinks from /usr/bin to tasks within tasks folder.
sudo ln -s $THIS_DIR/website-backup-application.sh /usr/bin/$USR_BIN_PREFIX-backup-application
sudo ln -s $THIS_DIR/website-backup-database.sh /usr/bin/$USR_BIN_PREFIX-backup-database
sudo ln -s $THIS_DIR/website-full-backup.sh /usr/bin/$USR_BIN_PREFIX-full-backup
sudo ln -s $THIS_DIR/website-switch.sh /usr/bin/$USR_BIN_PREFIX-switch
