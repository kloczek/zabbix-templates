#### Version: 1.0.4 (2018-05-05)

#### Description:
Base Zabbix server monitoring template.

#### Changelog:
- 1.0.4 (2018-05-05)
  - Applications:
    - rename ```SVC::Zabbix Server::process::busy``` to ```SVC::Zabbix Server::proc```
  - Graphs:
    - changed resolution to 1200x300
  - Items:
    - added all items descriptions
    - remove quotes around processes names to make migration from standard zabbix template easier
    - rename all process::* items to ```proc::*``` (keep it in sync with proxy template)
    - remove proc::busy::db watchdog % item (there is no such zabbix server process)
    - new items:
      - ```proc::busy::alert manager %```
      - ```proc::busy::db watchdog %```
      - ```proc::busy::escalator %```
      - ```proc::busy::ipmi manager %```
      - ```proc::busy::ipmi poller %```
      - ```proc::busy::java poller %```
      - ```proc::busy::preprocessing manager %```
      - ```proc::busy::preprocessing worker %```
      - ```proc::busy::proxy poller %```
      - ```proc::busy::task manager %```
      - ```proc::busy::timer %```
      - ```proc::busy::vmware collector %```
- 1.0.1 (2017-12-07):
  - removed monitoring zabbix[process,"db watchdog"] as it is no longer supported
  - add more desctiptions of the zabbix[process,] items
  - move all zabbix[process,] items to new application SVC::Zabbix Server::process::busy
  - change default history period to 2w
- 1.0.0 (2017-09-09):
  - initial version.

#### Notes:
* Host with this template must be monitored without any proxy.