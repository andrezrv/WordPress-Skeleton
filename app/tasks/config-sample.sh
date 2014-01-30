#!/bin/bash
# config-sample.sh
# 
# This is a sample configuration file for common backup tasks, such as saving
# a website's application files and storing dumps of a MySQL database.
# 
# Copy this file to config.sh and customize it according to your own needs.

# Project settings

# // Full path to the root of your project 
PROJECT_PATH="%%PROJECT_PATH%%"
# // Prefix for tasks that will be added to /usr/bin
USR_BIN_PREFIX="%%USR_BIN_PREFIX%%"

# Application settings

# // Full path to the folder that contains the application files you want to backup
APPLICATION_PATH="%%APPLICATION_PATH%%"
# // Full path to the folder where the application backup will be stored
APPLICATION_BACKUP_PATH="%%APPLICATION_BACKUP_PATH%%"
# // Maximum number of application backups to store
APPLICATION_MAX_BACKUPS="%%APPLICATION_MAX_BACKUPS%%"

# Database settings

# //User name for the database
DB_USER="%%DB_USER%%"
# // Password for the database
DB_PASSWORD="%%DB_PASSWORD%%"
# // Database name
DB_NAME="%%DB_NAME%%"
# // Full path to the folder where the database backups will be stored
DB_BACKUP_PATH="%%DB_BACKUP_PATH%%"
# // Maximum number of database backups to store
DB_MAX_BACKUPS="%%DB_MAX_BACKUPS%%"
