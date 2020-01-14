#### Version: 4.2.1 (2019-05-29)

#### Description:
Apache service monitoring template using zabbix active agent items.

#### Macros used by template:

| Macro                 | Default value       | Description                                         |
| :-------------------- | :------------------ | :-------------------------------------------------- |
| {$SVC_APACHE_PORT}    | 80                  | TCP port                                            |
| {$SVC_APACHE_PROCESS} | http                | non-root user used by workers Apache processes      |

#### Notes:
- This template uses apache mod_status metrics
- When this template is used on Ubuntu/Debian please change the host macro value ```{$HTTP_SERVICE_PROCESS}``` to ```apache2```
- To allow use this template in apache configuration must be present settings:
```
ExtendedStatus On
<Location /server-status>
            SetHandler server-status
            Order deny,allow
            Deny from all
            Allow from localhost
</Location>
```
#### Changelog:
- (devel):
  - Macros:
    - Rename all ```{$APACHE_SERVICE_*}``` macros to ```{$SVC_APACHE_*}```
    - Macro ```{$SVC_APACHE_PROCESS}```: has bee nadded to allow easy use it on Debian/Ubuntu. Default value is ```http```. On Ubuntu/Debian that value needs to be changed to ```apache2```
    - Add using ```{$SVC_APACHE_PROCESS}```, ```{$SVC_SVC_PORT}``` macros in more places in item names and triggers
  - Items:
    - Make template zabbix 4.0.x ready by remove using $1-$9 macros in items names
    - Rename ```net.tcp.service[http,,{$SVC_APACHE_PORT}]``` key item from ```SVC::$1``` to ```NET::$1```
  - Triggers:
    - rename ```SVC::Apache tcp/{$SVC_APACHE_PORT} is DOWN``` to ```NET::Apache tcp/{$SVC_APACHE_PORT} is DOWN```
- 1.0.4 (2018-06-11)
  - Graphs:
    - changed resolution of all graphs to 1200x300
  - Items:
    - rename s/Network::service::$1/```SVC::$1```/
  - Triggers:
    - rename s/SVC:httpd:Server is down/```SVC::http tcp/{$HTTP_SERVICE_PORT} is DOWN```/
- 1.0.1 (2017-12-01):
  - channge default history perid to 2w
  - moved some parts of the template description to README.md
  - Items:
     - added ServerMPM
     - added ServerVersion
     - use ServerUptimeSeconds in uptime item
- 1.0.0 (2017-09-09):
  - initial version
