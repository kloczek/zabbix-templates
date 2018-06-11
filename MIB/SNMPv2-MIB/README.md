#### Version: 1.0.4 (2018-06-11)

#### Description:
The template for SNMPv2 MIB entities.

#### OIDs tree: [SNMPv2-MIB](http://www.oidview.com/mibs/0/SNMPv2-MIB.html)

#### Changelog:
- 1.0.4 (2018-06-11):
  - Applications:
    - rename mib-2.system to ```SNMPv2-MIB::system``` and mib-2.system.snmp to '''SNMPv2-MIB::snmp''' to use matching MIB naming conventoion
  - Graphs:
    - change resolution to 1200x300
    - new normal graph ```SNMPv2-MIB::snmpPkts``` with SNMPv2-MIB::snmp{in,Out}Pkts OIDs presenting rate
      of SNMP requests/replies
  - Items:
     - changed units in update interval from number of seconds to number of m/h/d
- 1.0.1 (2017-11-22):
  - channge default history perid to 2w
  - add temlate description
- 1.0.0:
  - initial version.

#### Notes:
