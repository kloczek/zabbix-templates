# Zabbix templates

## Table of Contents
***
- [Changelog](#changelog)
  * [1.0.4](#104)
- [List of templates](#list-of-templates)
- [Notes and Guidlines](#notes-and-guidlines)
- [Copyright](#copyright--c--2017-2018-tomasz-k-oczko--kloczek-fedoraprojectorg)

## Changelog:
### 1.0.4
- This is first tagged in git repo set of templates and tools
- After this version development of all templates will be done only on branches and when everything will be ready devel branch will be merged to maste one
- Recent changes
  - All template:
    - change all graphs resolution to 1200x300
  - **ICMP**
    - Screens: 
      - new ```NET::ICMP```
  - **OS Limnux**
    - Items:
      - added ```MEM::``` items descriptions
      - fixed ```NET::segments retransmitted``` item
        use new sed regexp in this item:
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
      - new ```show_compatibility_56``` - show is MySQL engine working in MySQL 5.6 compatibility mode is ON/OFF
      - new ```Threads_cached``` - the number of threads in the thread cache
      - mew ```Threads_running``` - the number of threads that are not sleeping
    - Screens:
      - new ```SVC::MySQL::threads``` which combines ```SVC::MySQL::threads``` graph and ```Connections``` simple greph
    - Triggers:
      - new ```SVC::MySQL::version``` has been changed (severity: Not classified)
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
  - SNMPv2-MIB
  - SNMP-VIEW-BASED-ACM-MIB
  - UDP-MIB
- [OS Linux](https://github.com/kloczek/zabbix-templates/tree/master/OS%20Linux)
- OS Solaris
- OS Windows
- SNMP Devices
  - BIG-IP 5000
  - DSL-3782
- Service Apache
- Service MySQL
- Service Nginx
- Service Zabbix Agent
- Service Zabbix Proxy
- Service Zabbix Server

## Notes and Guidlines:
* Each template has own version tag which is copy of the whole zabbix-templates package version tag in which last changes has been released
* Each template in the description field has the last modification date and internal version
* If it is something which needs to be done to use those templates it is described in each template within description notes
* Naming convention for the items names, applications and triggers must adhere naming convention using 2-4 letter abbreviations:
  ```
  <CLASS>::<Name>
  <CLASS>::<SUBCLASS>::<Name>
  ```
  ##### Itemms Examples:
  ```
  HW::CPU
  MEM::Total Memory
  NET::ICMP::Loss
  NTP::WTS::Clock Frequency Adjustment
  ```
  This is to provide a parseable name, allowing us to distinguish between and categorise those objects.
  Such convention is quite easy to handle as pattern in alarming layer allowing for example send all tigger with SYS:: in the beginning name of the template to exact team.
  Such pattern is possible to use part of the general interface on communication with external services.
* Do not use {HOSTNAME} macros in triggers, as web frontend from Monitoring -> Triggers has a list with "host" column name on the host where the trigger is active (it is waste of space on web page)

##### Copyright (C) 2017-2018 Tomasz Kłoczko <kloczek@fedoraproject.org>

##### This program is free software, distributed under the terms of the GNU General Public License Version 2.
