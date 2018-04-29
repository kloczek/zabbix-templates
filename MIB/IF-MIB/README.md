#### Version: 1.0.2 (2017-11-22)

#### Description:
The MIB bsed template describes generic objects for network interface sub-layers.
The IF-MIB is an updated version of MIB-II's ifTable, and incorporates the extensions defined in RFC 1229.

#### OIDs tree: http://support.ipmonitor.com/mibs/IF-MIB/tree.aspx

#### Changelog:
- 1.0.2: (not released yet):
  - changed NIC LLD prototype to
    discovery[{#IFDESCR},IF-MIB::ifDescr,{#IFOPERSTATUS},IF-MIB::ifOperStatus]
    and added filter to remove from the list all interfaces with
    ifOperStatus=Down state. Switch from {#SNMPVALUE} to {#IFDESCR} as macro
    indexing all prototype items
  - removed Applications:
    - Interface
    - Interface::stat
    - Performance
  - added prototype Application on all NIC LLD prototype items
    IF-MIB::interface {#IFDESCR}
  - added screen IF-MIB::interfaces with 
- 1.0.1 (2017-11-22):
  - channge default history perid to 2w
  - better temlate description
  - added more descriptions of the LLD items
- 1.0.0:
  - initial version.

#### Notes:
