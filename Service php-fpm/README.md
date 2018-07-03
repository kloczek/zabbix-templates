#### Version: devel

#### Description:
PHP FastCGI Process Manager service monitoring template. This template is using:
- zabbix active agent items
- master item data obtained from by default http://localhost/status

#### Macros used by template:

| Macro | Default value | Description |
| :-- | :-- | :-- |
| {$SVC_PHP_FPM_HOST} | localhost | Hostname of the php-fpm service |
| {$SVC_PHP_FPM_PORT} | 80 | TCP port on which is listening php-fpm |
| {$SVC_PHP_FPM_STATS_URI} | /status | URI adderss of the status page |
| {$SVC_PHP_FPM_PROC} | php-fpm | php-fpm process name |

#### Changelog:
- (devel)
  - Initial version

#### Notes:
- The template uses php-fpm FPM status page so in php.ini must be enabled:
```
pm.status_path = /status
```
- In case of using nginx with php-fpm nginx.conf configuration file must have:
```
	location ~ ^/(status|ping)$ {
		access_log	off;
		allow		127.0.0.1;
		allow		::1;
		deny		all;
		include		fastcgi_params;
		fastcgi_index	index.php;
        	fastcgi_param	SCRIPT_FILENAME $document_root$fastcgi_script_name;

		fastcgi_pass	unix:/run/php-fpm/www.sock;
        }
```
- If on some Linux systems ```PROC::php-fpm``` item will be showing 0 processes find PID one of the working php-fpm process and use command ```basename $(readlink /proc/<PID>/exe)``` and update ```{$SVC_PHP_FPM_PROC}``` host macro content with value which this command show.
