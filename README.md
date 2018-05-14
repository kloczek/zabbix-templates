# Zabbix templates

## Table of Contents
***
- [Changelog](#changelog)
  * [1.0.4](#104)
- [List of templates](#list-of-templates)
- [Notes and Guidlines](#notes-and-guidlines)
- [Copyright](#copyright--c--2017-2018-tomasz-k-oczko--kloczek-fedoraprojectorg)
***
## Changelog:
### 1.0.4
- The first version tagged in git repo to stamp state of templates and tools and to provide better tracking changes by using ```git``` command
- The development of the next versions of the templates will continue on devel branch. When all changes are ready devel branch will be merged to master one. It will be way better for those who have interested enough tested template.
- Recent changes
  - All template:
    - change all graphs resolution to 1200x300
  - **ICMP**
    - Screens: 
      - new ```NET::ICMP```
  - **SNMPv2-MIB**
    - Items:
      - changed units in update interval from number of seconds to number of m/h/d
    - Graphs:
      - new normal graph SNMPv2-MIB::snmpPkts with SNMPv2-MIB::snmp{in,Out}Pkts OIDs presenting rate
        of SNMP requests/replies
  - **OS Limnux**
    - Items:
      - added ```MEM::``` items descriptions
      - fixed ```NET::segments retransmitted``` item use new sed regexp in this item
        ```s/\( *\)\(.*\) segments retransmitted*/\2/ p/```
    - Triggers:
      - fixed typo in name: s/SYS:uname changed/```SYS::uname changed```/
      - rename "Lack of free memory" to ```MEM::free {ITEM.LASTVALUE}```
      - use ```diff()```=1 function (instead ```change()``` and ```str()```) in triggers:
        - ```HW::devices list has been changed```
        - ```HW::CPU info has changed```
  - **OS Solaris**
    - Triggers:
      - fixed typo in trigger name s/SYS:uname changed/```SYS::uname changed```/
      - added ```MEM::free {ITEM.LASTVALUE}```
  - **OS Windows**
    - Triggers:
      - rename trigger name to the same name as it is in other OS templates
         s/Host information was changed/```SYS:uname changed```/
      - rename "Lack of free memory" to ```MEM::free {ITEM.LASTVALUE}```
  - **Service MySQL**
    - Applications:
      - new ```SVC::MySQL::cfg``` for all read configuration parameters
      - new ```SVC::MySQL::Com``` for all Com_* metrics
      - new ```SVC::MySQL::DB::{#DB}``` prototype for all per database metrics
      - new ```SVC::MySQL::innodb``` for all innodb storage engine metrics
      - new ```SVC::MySQL::threads``` for all treads related metrics
    - Graphs:
      - new ```SVC::MySQL::threads``` with ```Threads_cached```, ```Threads_connected``` and ```Threads_running``` metrics
    - Items:
      - new ```max_allowed_packet``` - the maximum size of one packet or any generated/intermediate string
      - new ```show_compatibility_56``` - show is MySQL engine running in MySQL 5.6 compatibility mode is ON/OFF
      - new ```Threads_cached``` - the number of threads in the thread cache
      - mew ```Threads_running``` - the number of threads that are not sleeping
      - rewrite most of the items SQL queries to use uppercase SQL keywords and lowercase for table names and row names (this will cause problems with imprt new template b
ut I need to standarize thuis before first officially announced release of the templates)
    - Screens:
      - new ```SVC::MySQL::threads``` which combines ```SVC::MySQL::threads``` graph and ```Connections``` simple greph
    - Triggers:
      - new ```SVC::MySQL::version``` has been changed (severity: Not classified)
  - **Service Zabbix Proxy**
    - Applications:
      - new ```SVC::Zabbix Proxy::proc```
    - Items:
      - delete items which have been by mistake copied from Service Zabbix Server template
        - wcache::text::free
        - wcache::text::total
        - wcache::text::used
      - move ```Processes::``` items to ```SVC::Zabbix Proxy::proc``` Application
      - rename all ```Processes::$4::$2``` to ```proc::$4::$2``` and remove quotes on all those items second key parameter (to allow easy migration from standard "Template App Zabbix Proxy" template)
  - **Service Zabbix Server**
    - Applications:
      - rename ```SVC::Zabbix Server::process::busy``` to ```SVC::Zabbix Server::proc```
  - **Service Nginx**
    - new template
***
## List of templates:
- [ICMP](https://github.com/kloczek/zabbix-templates/tree/master/ICMP)
- MIB
  - F5-BIGIP-LOCAL-MIB
  - F5-BIGIP-SYSTEM-MIB
  - IF-MIB
  - IP-MIB
  - SNMP-MPD-MIB
  - SNMP-USER-BASED-SM-MIB
  - [SNMPv2-MIB](https://github.com/kloczek/zabbix-templates/tree/master/MIB/SNMPv2-MIB)
  - SNMP-VIEW-BASED-ACM-MIB
  - UDP-MIB
- [OS Linux](https://github.com/kloczek/zabbix-templates/tree/master/OS%20Linux)
- [OS Solaris](https://github.com/kloczek/zabbix-templates/tree/master/OS%20Solaris)
- [OS Windows](https://github.com/kloczek/zabbix-templates/tree/master/OS%20Windows)
- SNMP Devices
  - BIG-IP 5000
  - DSL-3782
- Service Apache
- [Service MySQL](https://github.com/kloczek/zabbix-templates/tree/master/Service%20MySQL)
- [Service Nginx](https://github.com/kloczek/zabbix-templates/tree/master/Service%20Nginx)
- [Service Zabbix Agent](https://github.com/kloczek/zabbix-templates/tree/master/Service%20Zabbix%20Agent)
- [Service Zabbix Proxy](https://github.com/kloczek/zabbix-templates/tree/master/Service%20Zabbix%20Proxy)
- [Service Zabbix Server](https://github.com/kloczek/zabbix-templates/tree/master/Service%20Zabbix%20Server)

## Notes and Guidelines:
* Each template has own version tag which is the copy of the whole zabbix-templates package version tag in which last changes has released
* Each template in the description field has the last modification date and internal version
* If it is something which needs to be done to use those templates it is described in each template within description notes
* Naming convention for the items names, applications and triggers must adhere naming convention using 2-4 letter abbreviations:
  ```
  <CLASS>::<Name>
  <CLASS>::<SUBCLASS>::<Name>
  ```
  ##### Items Examples:
  ```
  HW::CPU
  MEM::Total Memory
  NET::ICMP::Loss
  NTP::WTS::Clock Frequency Adjustment
  ```
  Above provide a parseable name, allowing us to distinguish between and categorise those objects.
  Such convention is quite easy to handle as the pattern in alarming layer allowing, for example, send all trigger with SYS:: in the beginning name of the template to exact team.
  Such pattern is possible to use part of the general interface on communication with external services.
* Do not use {HOSTNAME} macros in triggers, as web frontend from Monitoring -> Triggers has a list with "host" column name on the host where the trigger is active (it is waste of space on the web page)
* All zabbix agent items should be specified as ```zabbix agent (active)``` items
* All graphs resolution needs to be 1200x300
* All SNMP items should be as SNMPv2 and ```{$SNMP_COMMUNITY}``` as SNMP read community name

Because all templates are using the same graphs resolution, item types and SNMP protocol version and community name with such settings are easy to change in all templates agent items type to passive one or change all other settings across all templates before import them.

##### Copyright (C) 2017-2018 Tomasz Kłoczko <kloczek@fedoraproject.org>

##### This program is free software, distributed under the terms of the GNU General Public License Version 2.
