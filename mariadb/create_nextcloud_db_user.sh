echo "#######################################"
echo "# Creating nextcloud database and user #"
echo "#######################################"

echo "CREATE DATABASE IF NOT EXISTS ncdb;
CREATE USER ncusr IDENTIFIED BY 'G0ldmine!';
GRANT ALL PRIVILEGES ON ncdb.* TO ncusr;
FLUSH PRIVILEGES;
SHOW GRANTS FOR ncusr;" | docker exec -i mariadb mariadb --user root -pG0ldmine!
