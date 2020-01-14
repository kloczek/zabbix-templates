# Zabbix templates
[![License: GPL v2](https://img.shields.io/badge/License-GPL%20v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)

This repository provides a set of templates which offers the alternative set of templates to supplied by Zabbix.

On [master](https://github.com/kloczek/zabbix-templates) branch is last stable version of the templates. Please report eny found issues or bugs.

Development of the next version of the templates is done on [devel](https://github.com/kloczek/zabbix-templates/tree/devel) branch.

If you have some changes for those templates please submit PR against **[devel](https://github.com/kloczek/zabbix-templates/tree/devel)**.

## Table of Contents
***
- [Changelog](#changelog)
  * [devel](devel)
  * [1.0.4](#104-2018-06-11)
- [List of templates](#list-of-templates)
- [Notes and Guidlines](#notes-and-guidelines)
- [Copyright](#copyright--c--2017-2018-tomasz-k-oczko--kloczek-fedoraprojectorg)
***
## Changelog:
### (devel)
- Make all templates zabbix 4.0.x ready by remove using $1-$9 macros in items names
- New templates
  - [Service php-fpm](https://github.com/kloczek/zabbix-templates/tree/devel/Service%20php-fpm)
- **IF-MIB**
  - LLDs:
    - interfaces: use ```IF-MIB::ifAdminStatus``` instead ```IF-MIB::ifOperusStatus``` on checking if interface is up or down
    - interfaces: add to LLD iterator item ```IF-MIB::ifIndex``` and map it to ```{#IFINDEX}``` macro
    - interfaces: add to all applications, items, triggers anf graphs prototypes names ```[{#IFINDEX}]``` to display physical port number in those names
    - graphs improvements
- **OS Linux**
  - template can be now used on Ubuntu and compatible as well (tested on Xenial and Bionic)
  - Items:
    - ```NET::segments retransmitted``` sed regexp changed to cover old "segments retransmited"
      output as well
    - replace ```SYS::rh-distribution``` by ```SYS::os-release``` which grabs the content of the
      ```/etc/os-releases``` using ```vfs.file.contents[/etc/os-release]``` key
      (this will be wortking on all LSB compliant distributions)
    - ```HW::CPU```` item key changed from ```system.hw.cpu``` to ```system.hw.cpu[,model]```
      because this option doesws not include current CPU frequency (which is constantly changing)
    - removed monitoring sshd, crond and rsyslogd as monitoring of those processes
      is not essential and will be provided in separated template(s)
    - ```DSK:``` LLD items Application changed from ```DSK``` prototype ```DSK::{#DISK}```
    - ```NET:``` LLD items Application changed from ```NET``` prototype ```NET::{#FSNAME}```
    - ```VOL:``` LLD items Application changed from ```VOL``` prototype ```VOL::{#FSNAME}```
    - make template zabbix 4.0.x ready by remove using $1-$9 macros in items names
    - new MEM:: metrics:
      - ```MEM::active```
      - ```MEM::anon```
      - ```MEM::inactive```
      - ```MEM::slab```
    - ```MEM::total``` history period changed to 1h as "Discard unchanged" filter preprocessor cannot be used for now
      https://support.zabbix.com/browse/ZBX-16456
  - LLD:
    - ```SWAP:``` new LLD with complet swap space monitoring which is added only when swap is used
      Swap monitoring consits of prototypes:
      - items: ```in```, ```total```, ```out``` and ```used``` with discard unchanged filter
      - ```SWAP``` and ```SWAP::in/out``` graphs
      - trigger: ```SWAP::low space ({$ITEM.VALUE}% used)```
        trigger is activated wnen more tha ```{$SWAP_HIGH}``` percent of the swap is used with default ```{$SWAP_HIGH}=80``` value
    - rewrited ```VOL``` triggers to use proper severities and triggers prototypes dependencies
    - LXC monitoring adaptations:
      - add in ```VOL:``` LLD filter off all volumes mounted under /var/lib/lxc. If ```OS Linux```
        template will used inside of each LXC container it will provide proper not duplicated
        monirtoring of the LXC container volumes
    - Added 4th level of the alarm in ```VOL::{#FSNAME}::free {ITEM.VALUE}``` LLD trigger
      Now alarms are raised <1%, <%5, <10% and now <20% free volume space
    - ```DSK:``` filter: corrected to get reed of loop devices. Use ```loop.[0-9]``` instead ```loop```
    - ```DSK:``` filter: remove from the list of moniitored block devices ZFS vdevs partitions and
      corrected regexp to remove all SCSI partitions
    - ```VOL:``` ``{#FSNAME}::total``` and ```{#FSNAME}::inodes::total``` history period changed to 1h
      as "Discard unchanged" filter preprocessor cannot be used for now
      https://support.zabbix.com/browse/ZBX-16456
  - Screens:
    - ```SWAP``` added with ```SWAP``` and ```SWAP::in/out``` graphs
    - new ```DSK, NET``` screen added
    - add to ```MEM``` screen ```MEM::active vs inactive``` graph
  - Triggers:
    - ```SYS::Host is down``` descrition corrected
    - ```CPU::idle``` triggers change to raise alarm when idle time is less than 5% CPU
      idle time time for at least 1 hour and alarm is cleared ehen for next hour will be no other
      flapping anbove 5%
    - Add proper dependency for all trigges which still does not depend on ```SYS::Host is down```
- **OS Solaris**
  - Applications:
    - remove using ```DSK```, ```NET``` and ```VOL``` Applications and replace them by LLD prototypes
      ```DSK::{#DISK}```, ```NET::{#IFNAME}``` and ```VOL::{#FSNAME}```
  - Items:
    - removed monitoring sshd, crond and rsyslogd as monitoring of those processes
      is not essential and will be provided in separated template(s)
    - make template zabbix 4.0.x ready by remove using $1-$9 macros in items names
    - copy the same set of 6 NET item LLD prototypes as in ```OS Linux``` template
      to cover monitoring in/out traffic in packets and bytes and errors and dropped
      packets as well
    - changed ```VOL:``` LLD items Application from fixed ```VOL``` to per volume ```VOL::{#FSNAME}```
      and added LLD VOL items descriptions
  - Triggers:
    - Added ```SYS::Host is down```
    - Added ```CPU::idle {ITEM.VALUE}```
    - Add proper dependency for all trigges which still does not depend on ```SYS::Host is down```
- **OS Windows**
  - Iems:
    - ```VOL:``` LLD items fixed Application ```VOL``` changed to per volume ```VOL::{#FSNAME}```
    - ```NET:``` LLD items fixed Application ```NET``` changed to per interface ```NET::{#FSNAME}```
  - Triggers:
    - Added missing ```SYS::Host is down``` trigger with all necessary dependencies
    - Add proper dependency for all trigges which still does not depend on ```SYS::Host is down```
- **Service Apache**
  - Macros:
    - Rename all ```{$APACHE_SERVICE_*}``` macros to ```{$SVC_APACHE_*}```
    - Macro ```{$SVC_APACHE_PROCESS}```: has bee nadded to allow easy use it on Debian/Ubuntu. Default value is ```http```. On Ubuntu/Debian that value needs to be changed to ```apache2```
    - Add using ```{$SVC_APACHE_PROCESS}```, ```{$SVC_SVC_PORT}``` macros in more places in item names and triggers
  - Items:
    - Make template zabbix 4.0.x ready by remove using $1-$9 macros in items names
    - Rename ```net.tcp.service[http,,{$HTTP_SERVICE_PORT}]``` key item from ```SVC::$1``` to ```NET::$1```
  - Macro ```{$HTTP_SERVICE_PROCESS}```: has bee nadded to allow easy use it on Debian/Ubuntu. Default value is ```http```. On Ubuntu/Debian that value needs to be changed to ```apache2```
  - Triggers:
    - rename ```SVC::Apache tcp/{$HTTP_SERVICE_PORT} is DOWN``` to ```NET::Apache tcp/{$HTTP_SERVICE_PORT} is DOWN```
- **Service MySQL**
  - Documented how to setup mysql server to allow monitor it
  - Items:
    - ```PROC::mysqld```
      - change hardcoded MySQL process name to the macro ``{$SVC_MYSQL_PROC}```
      - add missing "processes" unit
    - ```version``` add ```Discard unchanged with hartbeat``` filter which allows
      change sampling rate from 1d to 5min with HB preriod 7d
  - Triggers:
    - ```SYS::processes::{$SVC_MYSQL_PROC} is not running``` severity changed
      to disaster
    - change ```SVC::MySQL::version has changed to {ITEM.LASTVALUE}``` to ```Not classified```
  - Add use md markups in template description
- **Service Nginx**
  - Macros:
    - Rename ```{$NGINX_*}``` macros to ```{$SVC_NGINX_*}```
    - Added ```{$SVC_NGINX_USER}``` macro to allow use this template on Debian/Ubuntu as well
    - Rename ```{$SVC_NGINX_PROCESS}``` to ```{$SVC_NGINX_PROC}```
  - Graphs:
    - new ```SVC::Nginx::reqs_per_conn```
  - Items:
    - new calculated item ```reqs_per_conn``` which shows number requests in single connection (```nginx.requests")/last("nginx.requests[handled]```)
- **Service Zabbix Agent**
  - Graphs:
    - new ```HOST::items``` which presents number of host items vs number of unsuppoerted item
  - Items:
    - new ```items``` with current counter of total host items (supported/unsupprted/enabled/disabled)
  - Triggers:
    - change ```SVC::zabbix_agent::Version has changed to {ITEM.LASTVALUE}``` to ```Not classified```
- **Service Zabbix Server**
  Presentation layer impromements:
  - Graphs:
    - delete SVC::zabbix_server::items/wcache::buffer::pfree graph
    - new ```SVC::zabbix_server::hosts``` graph with number of monitored hosts
    - new ```SVC::zabbix_server::items/triggers``` graph with total number of items vs. triggers
    - new ```SVC::zabbix_server::items::nvps``` graphs with zabbix stack NVPS
  - Screens:
    - reorganized ```SVC::zabbix_server::status``` screen to put in rows:
      - "process busy %" and "internam process busy %"
      - "cahces usage %" and "vcache::hits/misses"
      - "processing queue" and flame like graph with "queued items"
      - "items totat/unsupported" and "items::nvps"
      - "items/triggers" and "hosts"
- **Service Zabbix Proxy**
  - Graphs:
    - ```SVC::zabbix_proxy::data gathering process busy %``` change the color of the ```http poller``` to bright yellow
- All graphs in screens resolution have been changed to 1200x200 or 600x200 in case screens with two columns of graphs
### 1.0.4 (2018-06-11)
- The first version tagged in git repo to stamp state of templates and tools and to provide better tracking changes by using ```git``` command
- The development of the next versions of the templates will continue on devel branch. When all changes are ready devel branch will be merged to master one. It will be way better for those who have interested enough tested template.
- Recent changes
  - All templates:
    - change all graphs resolution to 1200x300
  - **ICMP**
    - Screens: 
      - new ```NET::ICMP```
  - **MIB**
    - changed all description OID trees URLs to http://www.oidview.com/mibs/ based (http://support.ipmonitor.com seems no longer available)
    - **IF-MIB**
      - Applications:
        - the new prototype for all ```interfaces``` LLD prototype items
          ```IF-MIB::interfaces::{#IFDESCR}```
      - LLDs:
        - new ```interfaces``` LLD
          ```discovery[{#IFDESCR},IF-MIB::ifDescr,{#IFOPERSTATUS},IF-MIB::ifOperStatus]```
          and added filter to remove from the list all interfaces with
          ifOperStatus=Down state. Switch from {#SNMPVALUE} to {#IFDESCR} as macro
          indexing all prototype items
      - Screens:
        - new:
          - ```IF-MIB::ifHCOctets```
          - ```IF-MIB::ifOctets```
    - **SNMPv2-MIB**
      - Applications:
        - rename mib-2.system to ```SNMPv2-MIB::system``` and mib-2.system.snmp to ```SNMPv2-MIB::snmp``` to use matching MIB naming conventoion
      - Items:
        - changed units in update interval from number of seconds to number of m/h/d
      - Graphs:
        - new normal graph ```SNMPv2-MIB::snmpPkts``` with SNMPv2-MIB::snmp{in,Out}Pkts OIDs presenting rate
          of SNMP requests/replies
  - **OS Linux**
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
      - rename trigger to the same name as it is in other OS templates
         s/Host information was changed/```SYS:uname changed```/
      - rename "Lack of free memory" to ```MEM::free {ITEM.LASTVALUE}```
  - **Service MySQL**
    - Applications:
      - new:
      - ```SVC::MySQL::cfg``` for all read configuration parameters
      - ```SVC::MySQL::Com``` for all Com_* metrics
      - ```SVC::MySQL::DB::{#DB}``` prototype for all per database metrics
      -  ```SVC::MySQL::innodb``` for all innodb storage engine metrics
      - ```SVC::MySQL::threads``` for all treads related metrics
    - Graphs:
      - new ```SVC::MySQL::threads``` with ```Threads_cached```, ```Threads_connected``` and ```Threads_running``` metrics
    - Items:
      - new ```max_allowed_packet``` - the maximum size of one packet or any generated/intermediate string
      - new ```show_compatibility_56``` - show is MySQL engine running in MySQL 5.6 compatibility mode is ON/OFF
      - new ```Threads_cached``` - the number of threads in the thread cache
      - mew ```Threads_running``` - the number of threads that are not sleeping
      - rewrite most of the items SQL queries to use uppercase SQL keywords and lowercase for table names and row names (this will cause problems with imprt new template but I need to standarize thuis before first officially announced release of the templates)
    - Screens:
      - new ```SVC::MySQL::threads``` which combines ```SVC::MySQL::threads``` graph and ```Connections``` simple graph
    - Triggers:
      - new ```SVC::MySQL::version``` has been changed (severity: Not classified)
      - new ```SVC::MySQL::cfg::show_compatibility_56=ON``` (severity: High, because this template requires show_compatibility_56=OFF)
  - **Service Zabbix Proxy**
    - Applications:
      - new ```SVC::Zabbix Proxy::proc```
    - Graphs:
      - updated:
        - ```SVC::zabbix_proxy::process busy %```
        - ```SVC::zabbix_proxy::data gathering process busy %```
    - Items:
      - new:
        - ```proc::busy::configuration syncer```
        - ```proc::busy::data sender```
        - ```proc::busy::heartbeat sender```
        - ```proc::busy::ipmi manager```
        - ```proc::busy::ipmi poller```
        - ```proc::busy::java poller```
        - ```proc::busy::snmp trapper```
        - ```wcache::index::pfree```
      - delete items which have been by mistake copied from Service Zabbix Server template
        - ```wcache::text::free```
        - ```wcache::text::total```
        - ```wcache::text::used```
      - move ```Processes::``` items to ```SVC::Zabbix Proxy::proc``` Application
      - rename all ```Processes::$4::$2``` to ```proc::$4::$2``` and remove quotes on all those items second key parameter (to allow easy migration from standard "Template App Zabbix Proxy" template)
    - Triggers:
      - new:
        - ```SVC::zabbix_proxy::configuration syncer >=75% busy```
        - ```SVC::zabbix_proxy::data sender >=75% busy```
        - ```SVC::zabbix_proxy::heartbeat sender >=75% busy```
        - ```SVC::zabbix_proxy::ipmi manager >=75% busy```
        - ```SVC::zabbix_proxy::ipmi poller >=75% busy```
        - ```SVC::zabbix_proxy::java poller >=75% busy```
        - ```SVC::zabbix_proxy::snmp trapper >=75% busy```
        - ```SVC::zabbix_proxy::vmware collector >=75% busy```
  - **Service Zabbix Server**
    - Applications:
      - new:
        - ```SVC::Zabbix Server::rcache::buffer```
        - ```SVC::Zabbix Server::vcache::buffer```
        - ```SVC::Zabbix Server::vcache::cache```
        - ```SVC::Zabbix Server::wcache::history```
        - ```SVC::Zabbix Server::wcache::trend```
        - ```SVC::Zabbix Server::wcache::values```
      - rename ```SVC::Zabbix Server::process::busy``` to ```SVC::Zabbix Server::proc```
    - Graphs:
      - updated ```SVC::zabbix_server::process busy %```
      - new ```SVC::zabbix_server::preprocessing queue```
    - Items:
       - added all items descriptions
       - new:
         - ```proc::busy::alert manager %```
         - ```proc::busy::escalator %```
         - ```proc::busy::ipmi manager %```
         - ```proc::busy::ipmi poller %```
         - ```proc::busy::java poller %```
         - ```proc::busy::preprocessing manager %```
         - ```proc::busy::preprocessing worker %```
         - ```proc::busy::proxy poller %```
         - ```proc::busy::snmp trapper poller %```
         - ```proc::busy::task manager %```
         - ```proc::busy::timer %```
         - ```proc::busy::vmware collector %```
         - ```triggers```
         - ```queue::preprocessing```
       - remove items::queued (it duplicates information provided by queue::* items)
       - removed quotes around processes names to make migration from standard zabbix template easier
       - rename all process::* items to ```proc::*``` (keep it in sync with proxy template)
       - rename Uptime to ```uptime```
       - Triggers:
         - new:                                                           
           - ```SVC::zabbix_server::alert manager processes >=75% busy```
           - ```SVC::zabbix_server::escalator processes >=75% busy```
           - ```SVC::zabbix_server::ipmi manager processes >=75% busy```
           - ```SVC::zabbix_server::ipmi poller processes >=75% busy```
           - ```SVC::zabbix_server::java poller processes >=75% busy```
           - ```SVC::zabbix_server::preprocessing manager processes >=75% busy```
           - ```SVC::zabbix_server::preprocessing worker processes >=75% busy```
           - ```SVC::zabbix_server::proxy poller processes >=75% busy```
           - ```SVC::zabbix_server::snmp trapper processes >=75% busy```
           - ```SVC::zabbix_server::task manager processes >=75% busy```
           - ```SVC::zabbix_server::timer processes >=75% busy```
           - ```SVC::zabbix_server::vmware collector processes >=75% busy``` 
  - **Service Nginx**
    - new template
***
## List of templates:
- [ICMP](https://github.com/kloczek/zabbix-templates/tree/master/ICMP)
- MIB
  - [F5-BIGIP-LOCAL-MIB](https://github.com/kloczek/zabbix-templates/tree/master/MIB/F5-BIGIP-LOCAL-MIB)
  - [F5-BIGIP-SYSTEM-MIB](https://github.com/kloczek/zabbix-templates/tree/master/MIB/F5-BIGIP-SYSTEM-MIB)
  - [IF-MIB](https://github.com/kloczek/zabbix-templates/tree/master/MIB/IF-MIB)
  - [IP-MIB](https://github.com/kloczek/zabbix-templates/tree/master/MIB/IP-MIB)
  - [SNMP-MPD-MIB](https://github.com/kloczek/zabbix-templates/tree/master/MIB/SNMP-MPD-MIB)
  - [SNMP-USER-BASED-SM-MIB](https://github.com/kloczek/zabbix-templates/tree/master/MIB/SNMP-USER-BASED-SM-MIB)
  - [SNMPv2-MIB](https://github.com/kloczek/zabbix-templates/tree/master/MIB/SNMPv2-MIB)
  - [SNMP-VIEW-BASED-ACM-MIB](https://github.com/kloczek/zabbix-templates/tree/master/MIB/SNMP-VIEW-BASED-ACM-MIB)
  - [UDP-MIB](https://github.com/kloczek/zabbix-templates/tree/master/MIB/UDP-MIB)
- [OS Linux](https://github.com/kloczek/zabbix-templates/tree/master/OS%20Linux)
- [OS Solaris](https://github.com/kloczek/zabbix-templates/tree/master/OS%20Solaris)
- [OS Windows](https://github.com/kloczek/zabbix-templates/tree/master/OS%20Windows)
- SNMP Devices
  - BIG-IP 5000
  - DSL-3782
- [Service Apache](https://github.com/kloczek/zabbix-templates/tree/master/Service%20Apache)
- [Service MySQL](https://github.com/kloczek/zabbix-templates/tree/master/Service%20MySQL)
- [Service Nginx](https://github.com/kloczek/zabbix-templates/tree/master/Service%20Nginx)
- [Service php-fpm](https://github.com/kloczek/zabbix-templates/tree/devel/Service%20php-fpm)
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
  Such convention allows to handle use the pattern in alarming layer allowing on define actions. For example, send all trigger with SYS:: in the beginning name of the template to exact team.
  Such pattern is possible to use as part of the general interface on communication with external services.
* Do not use {HOSTNAME} macros in triggers. In web frontend from Monitoring -> Triggers table has "host" column with the host name of the the active trigger. Repeating second time this hos name in the trigger name it is waste of space on the web page.
* All zabbix agent items should be specified as ```zabbix agent (active)``` items.
* All graphs resolution needs to be 1200x300.
* All SNMP items should be as SNMPv2 and ```{$SNMP_COMMUNITY}``` as SNMP read community name.
* Trigger severities:
  * Disaster:
  * High:
  * Average:
  * Warning:
  * Information:
  * Not classified:
    - Version has changed
    - Configuration parametr has changed

Reason of use in all templates the same graphs resolution, item types and SNMP protocol version and community name is to provide easy way to change those settings across all templates is someone may need this.

##### Copyright (C) 2017-2018 Tomasz Kłoczko <kloczek@fedoraproject.org>

##### This program is free software, distributed under the terms of the GNU General Public License Version 2.