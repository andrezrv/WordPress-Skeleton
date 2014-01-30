#!/bin/bash
# website-settings.sh
# 
# This file is loaded after your config file and includes some settings that are
# not customizable.

# Include config file.
THIS_DIR=$(dirname "$(readlink -fn "$0")")
CONFIG=$THIS_DIR/config.sh
. $CONFIG

# Default settings

# // Full path to your application's website
APPLICATION_WEBSITE_PATH=$APPLICATION_PATH/live
# // Full path to your application's maintenance version
APPLICATION_MAINTENANCE_PATH=$APPLICATION_PATH/background
# // Full path to a transitional folder to be applied on maintenance tasks
APPLICATION_TRANSITIONAL_PATH=$APPLICATION_PATH/transition
# // Timestamp
DATE=$(date +"%Y%m%d%H%M")
