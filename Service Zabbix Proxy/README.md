#### Version: 1.0.4 (2018-06-11)

#### Description:
Base Zabbix proxy service monitoring template.

#### Changelog:
- 1.0.4 (2018-06-11):
  - Applications:
    - new ```SVC::Zabbix Proxy::proc``` 
  - Graphs:
    - change resolution of all graphs to 1200x300
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
- 1.0.0 (2017-09-09):
  - initial version.

#### Notes:
Host with this template must be monitored over proxy which will be monitored.