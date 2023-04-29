echo "#######################################"
echo "# Creating wordpress database and user #"
echo "#######################################"

echo "CREATE DATABASE IF NOT EXISTS wpdb;
CREATE USER wpusr IDENTIFIED BY 'G0ldmine!';
GRANT ALL PRIVILEGES ON wpdb.* TO wpusr;
FLUSH PRIVILEGES;
SHOW GRANTS FOR wpusr;" | docker exec -i mariadb mariadb --user root -pG0ldmine!
