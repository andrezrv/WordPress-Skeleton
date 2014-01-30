#!/bin/bash
# website-backup-application.sh
#
# Quickly backup the files of your website. This task assumes you have zip and
# sudo installed, and that your current user is in the list of sudoers.
 
# Include settings file.
THIS_DIR=$(dirname "$(readlink -fn "$0")")
SETTINGS=$THIS_DIR/website-settings.sh
. $SETTINGS

echo $APPLICATION_PATH

# Create backup directory if it doesn't exist.
if [ ! -d $APPLICATION_BACKUP_PATH ]; then
  sudo mkdir -p $APPLICATION_BACKUP_PATH
fi

# Backup your files to your selected folder using zip.
sudo zip --symlinks -r $APPLICATION_BACKUP_PATH\/$DATE\.zip $APPLICATION_PATH
# Clean backup directory.
cd $BACKUP_PATH; (ls -t|head -n $APPLICATION_MAX_BACKUPS;ls)|sort|uniq -u|xargs rm
