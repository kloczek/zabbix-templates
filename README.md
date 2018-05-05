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
  - ICMP:
    - Screens: 
      - new NET::ICMP
  - OS Limnux:
    - Items:
      - added MEM::* items descriptions
      - fixed NET::segments retransmitted item
        use new sed regexp in this item: ```s/\( *\)\(.*\) segments retransmitted*/\2/ p/"```
    - Triggers:
      - fixed typo in name: s/SYS:uname changed/SYS::uname changed/
      - rename "Lack of free memory" to "MEM::free {ITEM.LASTVALUE}"
      - use diff()=1 function (instead change() and str()) in triggers:
        - HW::devices list has been changed
        - HW::CPU info has changed

## List of templates:
- ICMP
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
- OS Linux
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
