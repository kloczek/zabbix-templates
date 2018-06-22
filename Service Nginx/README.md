#### Version: (devel)

#### Description:
Nginx https service monitoring template. This template is using
- zabbix active agent items
- master item data obtained from by default http://localhost/stub_status

#### Macros used by template:

| Macro              | Default value       | Description                                         |
| :----------------- | :------------------ | :-------------------------------------------------- |
| {$NGINX_HOST}      | localhost           | Hostname of the nginx service                       |
| {$NGINX_PORT}      | 80                  | TCP port                                            |
| {$NGINX_STATS_URI} | /stub_status        | URI adderss of the status_stub page                 |
| {$NGINX_USER}      | nginx               | nginx non-root user used by workers nginx processes |

#### Changelog:
- (devel)
  - Graphs:
    - new ```SVC::Nginx::reqs_per_conn```
  - Items:
    - new calculated item ```requs_per_conn``` which shows number requests in single connection (```nginx.requests")/last("nginx.requests[handled]```)
- 1.0.4 (2018-06-11)
  - Initial version

#### Notes:
- This template uses nginx stub_status loadable module metrics
- To use this template add nginx.conf configuration file:
```
    location /stub_status {
	stub_status	on;
	# do not log query for stats in access log
	access_log	off;
	allow		127.0.0.1;
	deny		all;
    }
```
