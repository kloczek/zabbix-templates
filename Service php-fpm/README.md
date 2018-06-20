#### Version: devel

#### Description:
PHP FastCGI Process Manager service monitoring template. This template is using
- zabbix active agent items
- master item data obtained from by default http://localhost/status

#### Macros used by template:

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
