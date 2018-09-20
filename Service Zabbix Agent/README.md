#### Version: devel ()

#### Description:
Base zabbix agent monitoring.

#### Changelog:
- (devel)
  - Graphs:
    - New ```HOST::items``` which presents number of host items vs number of unsuppoerted item
  - Items:
    - New ```items``` with current counter of total host items (supported/unsupprted/enabled/disabled)
    - Added agent.hostname with trigger
  - Triggers:
    - Added trigger for agent unreachable more than 7 days.
- 1.0.4 (2018-06-11):
  - minor clenups in template description
- 1.0.1 (2017-11-30):
  - channge default hiory perid to 2w
  - moved temmplate Changelog to README.md and added temlate URL in description
- 1.0.0 (2017-09-09):
  - initial version

#### Notes:
