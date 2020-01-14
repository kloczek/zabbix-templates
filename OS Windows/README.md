#### Version: devel (2019-06-01)

#### Description:
Base OS Windows template.

#### Notes:

#### Contributors:
- ss: Scott Simmons
- tk: Tomasz Kłoczko

#### Changelog:
- (devel):
  - Items:
    - Make template zabbix 4.0.x ready by remove using $1-$9 macros in items names
    - ```VOL:``` LLD items fixed Application ```VOL``` changed to per volume ```VOL::{#FSNAME}```
    - ```NET:``` LLD items fixed Application ```NET``` changed to per interface ```NET::{#FSNAME}```
  - Triggers:
    - Added missing ```SYS::Host is down``` trigger with all necessary dependencies
    - Add proper dependency for all trigges which still does not depend on ```SYS::Host is down```
  - Screens:
    - Added ```CPU``` screen like in other Os templates
- 1.0.4 (2018-06-11)
  - Triggers:
    - Rename trigger name to the same name as it is in other OS templates
       s/Host information was changed/```SYS:uname changed```/
    - Rename "Lack of free memory" to ```MEM::free {ITEM.LASTVALUE}```
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
- 1.0.0:
  - initial version
