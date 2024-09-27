-- Create 'orm' user with password 'orm' and grant all privileges
CREATE USER 'orm'@'%' IDENTIFIED BY 'orm';
GRANT ALL PRIVILEGES ON *.* TO 'orm'@'%' WITH GRANT OPTION;

-- Set authentication plugin to mysql_native_password for compatibility
ALTER USER 'orm'@'%' IDENTIFIED WITH mysql_native_password BY 'orm';

-- Apply privileges
FLUSH PRIVILEGES;

-- Create database if not exists (optional, as MYSQL_DATABASE environment variable should create it)
CREATE DATABASE IF NOT EXISTS exporter;