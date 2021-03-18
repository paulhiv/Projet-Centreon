CREATE USER 'admin'@'centreon-central' IDENTIFIED BY 'Azerty';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'centreon-central' WITH GRANT OPTION;
FLUSH PRIVILEGES;