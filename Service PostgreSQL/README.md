PostgreSQL engine monitoring over Zabbix agent.

#### Version: (devel)
URL: https://github.com/kloczek/zabbix-templates/tree/master/Service%20PostgreSQL

#### Macros used by template:
| Macro | Default value | Description |
| :-- | :-- | :-- |
| {$SVC_PSQL_HOST} | localhost | Hostname of the Postgresql service to monitor |
| {$SVC_PSQL_PORT} | 5432 | TCP port on which is listening monitored PostgreSQL |
| {$SVC_PSQL_PROC} | postgres | PosgreSQL process name |

#### Notes:
* This template temporary is used with set of the UserParameter which needs to be added to agent configuration
  (just drop UserParameter=service.pgsql file into /etc/zabbix/zabbix_agentd.d directory) however my plan is to
  implement at the end all necessary keys as as loadable module
* Tested on PosgreSQL 9.5

* By default this template is monitoring the engine working on localhost
* To be able to use this template on a host you need to setup a monitoring account with the proper privileges
* To add such account you can use below queries:
```
su - postgres psql -c "create user monitoring with password 'monitoring';"
su - postgres psql -c "grant SELECT ON pg_stat_database, pg_stat_user_tables, pg_stat_user_indexes, pg_stat_bgwriter, pg_statio_user_tables to monitoring;"
```
* PostgreSQL 9.5 documentation about monitoring:
https://www.postgresql.org/docs/9.6/monitoring-stats.html
