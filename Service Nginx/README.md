#### Version: (devel)

#### Description:
Nginx https service monitoring template. This template is using
- zabbix active agent items
- master item data obtained from by default http://localhost/stub_status

#### Macros used by template:

| Macro                  | Default value       | Description                                         |
| :--------------------- | :------------------ | :-------------------------------------------------- |
| {$SVC_NGINX_HOST}      | localhost           | Hostname of the nginx service                       |
| {$SVC_NGINX_PORT}      | 80                  | TCP port                                            |
| {$SVC_NGINX_PROC}      | nginx               | nginx non-root user used by workers nginx processes |
| {$SVC_NGINX_STATS_URI} | /stub_status        | URI adderss of the status_stub page                 |
| {$SVC_NGINX_USER}      | nginx               | nginx non-root user used by workers nginx processes |

#### Notes:
- This template uses nginx stub_status loadable module metrics
- On Debian/Ubuntu change ```{$SVC_NGINX_USER}``` macro value to ```www-data```
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
#### Changelog:
- (devel):
  - Macros:
    - Rename ```{$NGINX_*}``` macros to ```{$SVC_NGINX_*}```
    - Added ```{$SVC_NGINX_USER}``` macro to allow use this template on Debian/Ubuntu as well
    - Rename ```{$SVC_NGINX_PROCESS}`` to ```{$SVC_NGINX_PROC}```
  - Graphs:
    - new ```SVC::Nginx::reqs_per_conn```
  - Items:
    - make template zabbix 4.0.x ready by remove using $1-$9 macros in items names
    - new calculated item ```requs_per_conn``` which shows number requests in single connection (```nginx.requests")/last("nginx.requests[handled]```)
    - ```SVC::$1 tcp/$3```: add using ```{$SVC_NGINX_PORT}``` macro
- 1.0.4 (2018-06-11)
  - Initial version
