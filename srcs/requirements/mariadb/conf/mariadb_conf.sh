# Start MySQL service
service mysql start;

# Create the SQL_DATABASE database
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Create the SQL_USER with the SQL_PASSWORD password
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# Give rights to SQL_USER with the password SQL_PASSWORD on SQL_DATABASE
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# Change root rights with the SQL_ROOT_PASSWORD password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# Update the configuration of MySQL
mysql -e "FLUSH PRIVILEGES;"

# Shudown MySQL
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# Restart MySQL with the new configuration
exec mysqld_safe
