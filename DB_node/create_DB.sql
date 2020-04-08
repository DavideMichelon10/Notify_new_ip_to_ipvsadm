-- CREATE USER ipvs 
CREATE USER 'ipvs'@'localhost' IDENTIFIED BY 'root';
CREATE USER 'ipvs'@'%' IDENTIFIED BY 'root';
GRANT ALL ON *.* TO 'ipvs'@'localhost';
GRANT ALL ON *.* TO 'ipvs'@'%';
FLUSH PRIVILEGES;

-- remember to configure interface to be accessible outside.
-- To do this: in /etc/mysql/mysql.conf.d/mysqld.cnf modify binding

-- CREATE DATABASE and TABLE
CREATE DATABASE DB_IP;
USE DB_IP;

CREATE TABLE ip(
  id int not null auto_increment,
  ip varchar(15) not null,
  opt char(1),
  primary key(id)
);



