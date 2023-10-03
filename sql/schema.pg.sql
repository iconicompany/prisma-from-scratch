DROP DATABASE IF EXISTS mydb;
create database mydb;
CREATE USER johndoe WITH PASSWORD 'randompassword';
GRANT ALL PRIVILEGES ON DATABASE mydb to johndoe;
ALTER USER johndoe CREATEDB;
