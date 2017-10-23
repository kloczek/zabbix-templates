Active agent monitoring of the MySQL engine.

Current version : 1.0.2

Date:             2017-10-23

Changelog:
1.0.2
- replace use @MySQL::DB global regexp in MySQL::DB LLD by in place regexp (remove global regexp dependency)
- change LLDs update interval from 1 to 30min

1.0.1:
- added missing entries in SVC::MySQL::Queries screen

1.0:
- initial version.

Notes:
* Tested on MySQL 5.7 and it not uses MySQL 5.6 backward compatibility so it can be used to monitor MySQL engine which in my.cnf has:

[mysqld]
show_compatibility_56 = OFF 

My advice is even to disable show_compatibility_56 to not start by mistake use some older metrics which in next version of the MySQL no longer will be avalaible as an option.

* By default this template is monitoring the engine working on localhost.
To be able to use this template on a host you need to setup a monitoring account with the proper privileges.
To add such account you can use below queries:

CREATE USER 'monitoring'@'localhost' IDENTIFIED BY 'monitoring';
GRANT SELECT, INDEX, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'monitoring'@'localhost';
FLUSH PRIVILEGES;

* MySQL 5.7 documentation:
http://dev.mysql.com/doc/refman/5.7/en/innodb-parameters.html
http://dev.mysql.com/doc/refman/5.7/en/innodb-configuration.html
http://dev.mysql.com/doc/refman/5.7/en/innodb-information-schema.html
