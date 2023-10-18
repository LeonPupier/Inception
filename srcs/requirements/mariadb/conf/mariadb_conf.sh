#!/bin/bash

set -e

# Start MySQL service
service mysql start

if [ ! -d "/var/lib/mysql/$SQL_DATABASE" ]

then

# Secure install
mysql_secure_installation << EOF

n
y
y
y
y
EOF

# Create the SQL_DATABASE database
mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;"

# Create the SQL_USER with the SQL_PASSWORD password
mysql -uroot -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"

# Give rights to SQL_USER on SQL_DATABASE
mysql -uroot -e "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%';"

# Update the configuration of MySQL
mysql -uroot -e "FLUSH PRIVILEGES;"

# Change root rights with the SQL_ROOT_PASSWORD password
mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"

fi

# Shudown MySQL
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# Restart MySQL with the new configuration
exec "$@"
