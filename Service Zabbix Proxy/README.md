#### Version: 1.0.4 (2018-05-05)

#### Description:
Base Zabbix proxy service monitoring template.

#### Changelog:
- 1.0.4 (2018-05-05):
  - Applications:
    - new ```SVC::Zabbix Proxy::proc``` 
  - Graphs:
    - change resolution of all graphs to 1200x300
  - Items:
    - delete items which have been by mistake copied from Service Zabbix Server template
      - wcache::text::free
      - wcache::text::total
      - wcache::text::used
    - move ```Processes::``` items to ```SVC::Zabbix Proxy::proc``` Application
    - rename all ```Processes::$4::$2``` to ```proc::$4::$2``` and remove quotes on all those items second key parameter (to allow easy migration from standard "emplate App Zabbix Proxy" template)
- 1.0.0 (2017-09-09):
  - initial version.

#### Notes:
Host with this template must be monitored over proxy which will be monitored.