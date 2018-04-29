Nginx https service monitoring template using zabbix active agent items and master item obtained by default from http://localhost/stub_status.

Version: 1.0.0 (WIP)

Changelog:
- 1.0.0 (WIP):
  - Initial version

Notes:
- This template uses nginx stub_status loadable module metrics.
- To allow use this template in nginx.conf configuration file must be present:
In nginx.config:
```
    location /nginx_status {
	stub_status	on;
	# I do not log query for stats in access log
	access_log	off;
	allow		127.0.0.1;
	deny		all;
    }
```
