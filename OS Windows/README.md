#### Version: 1.0.4 (2018-06-11)

#### Description:
Base OS Windows template.

During import into your Zabbix stack if you have an error such as "Cannot import, linked template does not exist" then import the dependant template first, then this one after.

#### Requirements:

Import ICMP template
Service Zabbix Agent template
Active agent

#### Changelog:
- (devel)
  - Apps:
    - Added AV (AntiVirus)
  - LLD:
    - Added SVC (Service) LLD
  - Items:
    - Added Critical Log items
    - Added HW items
    - Renamed PROC and THRD items
    - Removed single duplicate item
    - Updated intervals
    - Added SYNC items
  - Triggers:
    - Added missing ```SYS::Host is down``` trigger with all necessary dependencies
    - Adjusted trigger priorities, added more triggers.
  - Graphs:
    - Added SIND graphs for indexes and merges L0 - L8.
    - Added NET V4 UDP and TCP.
- 1.0.4 (2018-06-11)
  - Triggers:
    - rename trigger name to the same name as it is in other OS templates
       s/Host information was changed/```SYS:uname changed```/
    - rename "Lack of free memory" to ```MEM::free {ITEM.LASTVALUE}```
  - Graphs:
    - change resolution to 1200x300
- 1.0.3
  - Added TCP and UDP V4 items (ss)
  - Added more items to PROC with descriptions (ss)
  - Added more SIND items and changed all intervals update 1m -> 5m (ss)
  - Removed unused RBC, NLOG and SS applications (storage spaces) (ss)
- 1.0.2
  - Added more items from typeperf counters (ss)
  - Added more item descriptions (ss)
  - Changed Bitlocker from BITL to BLOC as application name (ss)
  - Added additional application MEM::CAC, for items specifically related to cached memory (ss)
- 1.0.1 (2017-11-30):
  - added more applications (ss)
  - added items across the board (ss)
  - moved some items (ss)
  - removed Network::ICMP as this metric is now provided by ICMP template (tk)
Changelog:
- 1.0.0:
  - initial version

#### Notes:

#### Contributors:
- ss: Scott S.
- tk: Tomasz Kłoczko
