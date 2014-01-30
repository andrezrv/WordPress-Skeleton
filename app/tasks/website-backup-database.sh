#!/bin/bash
# website-backup-database.sh
#
# Quickly backup your website's database. This task assumes you have mysql and
# gzip installed.
 
# Include settings file.
THIS_DIR=$(dirname "$(readlink -fn "$0")")
SETTINGS=$THIS_DIR/website-settings.sh
. $SETTINGS

# Create backup directory if it doesn't exist.
if [ ! -d $DB_BACKUP_PATH ]; then
  sudo mkdir -p $DB_BACKUP_PATH
fi
 
# Backup your files to your selected folder using mysqldump and gzip.
sudo mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME | gzip > $DB_BACKUP_PATH\/$DATE\.sql.gz
# Clean backup directory.
cd $DB_BACKUP_PATH; (ls -t|head -n $DB_MAX_BACKUPS;ls)|sort|uniq -u|xargs rm
