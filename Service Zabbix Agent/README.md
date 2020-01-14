#### Version: devel ()

#### Description:
Base zabbix agent monitoring.

#### Notes:

#### Changelog:
- (devel):
  - Graphs:
    - new ```HOST::items``` which presents number of host items vs number of unsuppoerted item
  - Items:
    - make template zabbix 4.0.x ready by remove using $1-$9 macros in items names
    - new ```items``` with current counter of total host items (supported/unsupprted/enabled/disabled)
  - Triggers:
    - change ```SVC::zabbix_agent::Version has changed to {ITEM.LASTVALUE}``` to ```Not classified```
- 1.0.4 (2018-06-11):
  - minor clenups in template description
- 1.0.1 (2017-11-30):
  - channge default hiory perid to 2w
  - moved temmplate Changelog to README.md and added temlate URL in description
- 1.0.0 (2017-09-09):
  - initial version
