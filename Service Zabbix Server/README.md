#### Version: 1.0.4 (2018-06-11)

#### Description:
Base Zabbix server monitoring template.

#### Changelog:
- (devel)
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
- 1.0.4 (2018-06-11)
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
    - changed resolution to 1200x300
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
- 1.0.1 (2017-12-07):
  - removed monitoring zabbix[process,"db watchdog"] as it is no longer supported
  - add more desctiptions of the zabbix[process,] items
  - move all zabbix[process,] items to new application SVC::Zabbix Server::process::busy
  - change default history period to 2w
- 1.0.0 (2017-09-09):
  - initial version.

#### Notes:
* Host with this template must be monitored without any proxy.