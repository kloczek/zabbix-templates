## Zabbix templates

List of templates:
- ICMP
- OS Linux
- OS Solaris
- OS Windows
- Service Apache
- Service MySQL
- Service Zabbix Agent
- Service Zabbix Proxy
- Service Zabbix Server

Notes:
* If it is something which needs to be done to use those templates it is described in each template within description notes
* Each template in the description field has the last modification date and internal version

Templated items, applications and triggers adhere to this naming convention:
CLASS::SUBCLASS::Name

This is to provide a parseable name, allowing us to distinguish between and categorise those objects.
Such convention is quite easy to handle as pattern in alarming layer allowing for example send all tigger with SYS:: in the beginning name of the template to exact team.
Such pattern is possible to use part of the general interface on communication with external services.

* Do not use {HOSTNAME} macros in triggers as web frontend in trigger list in other column is name of the host on which trigger is active (it is waste of space on web page)
 
## Copyright (C) 2017 Tomasz Kłoczko <kloczek@fedoraproject.org>

## This program is free software, distributed under the terms of the GNU General Public License Version 2.
