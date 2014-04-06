# Make a database, if we don't already have one
echo "Creating database (if it's not already there)"
mysql -u root --password=root -e "CREATE DATABASE IF NOT EXISTS wordpress_dev"
mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON wordpress_dev.* TO wp@localhost IDENTIFIED BY 'wp';"
