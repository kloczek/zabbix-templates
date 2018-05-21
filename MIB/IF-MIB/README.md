#### Version: 1.0.4 (2018-05-05)

#### Description:
The MIB bsed template describes generic objects for network interface sub-layers.
The IF-MIB is an updated version of MIB-II's ifTable, and incorporates the extensions defined in RFC 1229.

#### OIDs tree: (IF-MIB](http://www.oidview.com/mibs/0/IF-MIB.html)

#### Changelog:
- 1.0.4: (2018-05-05):
  - Applications:
    - the new prototype for all ```interfaces``` LLD prototype items
      ```IF-MIB::interfaces::{#IFDESCR}```
  - Graphs:
    - change resolution of all graphs to 1200x300
  - LLDs:
    - new ```interfaces``` LLD
      ```discovery[{#IFDESCR},IF-MIB::ifDescr,{#IFOPERSTATUS},IF-MIB::ifOperStatus]```
      and added filter to remove from the list all interfaces with
      ifOperStatus=Down state. Switch from {#SNMPVALUE} to {#IFDESCR} as macro
      indexing all prototype items
  - Screens:
    - new ```IF-MIB::ifHCOctets```
    - new ```IF-MIB::ifOctets```
- 1.0.1 (2017-11-22):
  - channge default history perid to 2w
  - better temlate description
  - added more descriptions of the LLD items
- 1.0.0:
  - initial version.

#### Notes:
