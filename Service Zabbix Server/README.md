#### Version: 1.0.1 (2017-09-09)

#### Description:
Base Zabbix server monitoring template.

#### Changelog:
- 1.0.1 (2017-12-07):
  - removed monitoring zabbix[process,"db watchdog"] as it is no longer supported
  - add more desctiptions of the zabbix[process,] items
  - move all zabbix[process,] items to new application SVC::Zabbix Server::process::busy
  - change default history period to 2w
- 1.0.0 (2017-09-09):
  - initial version.

#### Notes:
* Host with this template needs to monitored without any proxy.