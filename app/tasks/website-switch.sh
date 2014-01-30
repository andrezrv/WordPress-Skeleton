#!/bin/bash
# website-switch.sh
#
# This task changes the state of your website from live to maintenance and
# from maintenance to live. 

# Include settings file.
THIS_DIR=$(dirname "$(readlink -fn "$0")")
SETTINGS=$THIS_DIR/website-settings.sh
. $SETTINGS

# Move your current working configuration file to a third location.
sudo mv $APPLICATION_WEBSITE_PATH $APPLICATION_TRANSITIONAL_PATH
# Move your background configuration file to your working location.
sudo mv $APPLICATION_MAINTENANCE_PATH $APPLICATION_WEBSITE_PATH
# Move your file kept in transition to background location.
sudo mv $APPLICATION_TRANSITIONAL_PATH $APPLICATION_MAINTENANCE_PATH
