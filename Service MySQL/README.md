#### Version: 1.0.4 (2018-06-11)

#### Description:
MySQL engine monitoring over Zabbix agent.

#### Changelog:
- 1.0.4 (2018-06-11):
  - Applications:
    - new ```SVC::MySQL::cfg``` for all read configuration parameters
    - new ```SVC::MySQL::Com``` for all Com_* metrics
    - new ```SVC::MySQL::DB::{#DB}``` prototype for all per database metrics 
    - new ```SVC::MySQL::innodb``` for all innodb storage engine metrics
    - new ```SVC::MySQL::threads``` for all treads related metrics
  - Graphs:
    - new ```SVC::MySQL::threads``` with ```Threads_cached```, ```Threads_connected``` and ```Threads_running``` metrics
    - changed resolution of all graphs to 1200x300
  - Items:
    - new ```max_allowed_packet``` - the maximum size of one packet or any generated/intermediate string
    - new ```show_compatibility_56``` - show is MySQL engine running in MySQL 5.6 compatibility mode is ON/OFF
    - new ```Threads_cached``` - the number of threads in the thread cache
    - mew ```Threads_running``` - the number of threads that are not sleeping
    - rewrite most of the items SQL queries to use uppercase SQL keywords and lowercase for table names and row names (this will cause problems with imprt new template but I need to standarize thuis before first officially announced release of the templates)
  - Screens:
    - new ```SVC::MySQL::thread```s which combines ```SVC::MySQL::threads``` graph and ```Connections``` simple graph
  - Triggers:
    - new ```SVC::MySQL::version``` has been changed (severity: Not classified)
    - new ```SVC::MySQL::cfg::show_compatibility_56=ON``` (severity: High, because this template requires show_compatibility_56=OFF)
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
  - initial version.

#### Notes:
- Tested on MySQL 5.7 and it not uses MySQL 5.6 backward compatibility.  The
  template requires to disable MySQL 5.6 backward compatibility and it will
  raise alarm that show_compatibility_56 is OFF. To disable MySQL 5.6
  backward compatibility best to add in my.cnf:
```
[mysqld]
show_compatibility_56=OFF
```
- By default this template is monitoring the engine working on localhost
- To be able to use this template on a host you need to setup a monitoring account with the proper privileges. To add such account you can use below queries:
```
CREATE USER 'monitoring'@'localhost' IDENTIFIED BY 'monitoring';
GRANT SELECT, INDEX, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'monitoring'@'localhost';
FLUSH PRIVILEGES;
```
- MySQL 5.7 documentation:
  - http://dev.mysql.com/doc/refman/5.7/en/innodb-parameters.html
  - http://dev.mysql.com/doc/refman/5.7/en/innodb-configuration.html
  - http://dev.mysql.com/doc/refman/5.7/en/innodb-information-schema.html