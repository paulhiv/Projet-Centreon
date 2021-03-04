CREATE USER 'azerty'@'centreon-engine' IDENTIFIED BY 'azerty';
GRANT ALL PRIVILEGES ON *.* TO 'azerty'@'centreon-engine' WITH GRANT OPTION;
FLUSH PRIVILEGES;