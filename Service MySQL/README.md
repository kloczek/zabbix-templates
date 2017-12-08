Active agent monitoring of the MySQL engine.

Version: 1.0.3 (2017-11-30)

Changelog:
- 1.0.4 (not reeaed yet):
  - added applications (improved gouping metrics Last data view):
    - SVC::MySQL::cfg for all read configuration parameters
    - SVC::MySQL::Com for all Com_* metrics
    - SVC::MySQL::DB::{#DB} prototype for all per database metrics 
    - SVC::MySQL::innodb for all innodb storage engine metrics
    - SVC::MySQL::threads for all treads related metrics
  - added graphs:
    - SVC::MySQL::threads with: Threads_cached, Threads_connected and Threads_running metrics
  - added metrics:
    - max_allowed_packet - the maximum size of one packet or any generated/intermediate string
    - show_compatibility_56 - show is MySQL engine working in MySQL 5.6 compatibility mode is ON/OFF
    - Threads_cached - the number of threads in the thread cache
    - Threads_running - the number of threads that are not sleeping
  - added screens:
    - SVC::MySQL::threads with SVC::MySQL::threads (graph) and Connections (simple greph)
  - added triggers:
    - SVC::MySQL::version has been changed (severity: Not classified)
- 1.0.3 (2017-11-30):
  - fix: added missing "^" in MySQL::DB filter which has been causing not filter off information_schema, mysql, performance_schema and sys databases
  - template Changelog no longer maintained in template description
  - changed width of graphs in MySQL::DB screen to 900 and remove unused screen cells
  - channge default history perid to 2w
- 1.0.2
  - replace use @MySQL::DB global regexp in MySQL::DB LLD by in place regexp (remove global regexp dependency)
  - change LLDs update interval from 1 to 10min
- 1.0.1:
  - added missing entries in SVC::MySQL::Queries screen
- 1.0.0:
  - initial version

Notes:
- Tested on MySQL 5.7 and it not uses MySQL 5.6 backward compatibility so it can be used to monitor MySQL engine which in my.cnf has:
```
[mysqld]
show_compatibility_56 = OFF 
```
My advice is even to disable show_compatibility_56 to not start by mistake use some older metrics which in next version of the MySQL no longer will be avalaible as an option.

- By default this template is monitoring the engine working on localhost.
To be able to use this template on a host you need to setup a monitoring account with the proper privileges.
To add such account you can use below queries:
```
CREATE USER 'monitoring'@'localhost' IDENTIFIED BY 'monitoring';
GRANT SELECT, INDEX, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'monitoring'@'localhost';
FLUSH PRIVILEGES;
```
- MySQL 5.7 documentation:
  - http://dev.mysql.com/doc/refman/5.7/en/innodb-parameters.html
  - http://dev.mysql.com/doc/refman/5.7/en/innodb-configuration.html
  - http://dev.mysql.com/doc/refman/5.7/en/innodb-information-schema.html
