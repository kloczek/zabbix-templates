To start working on temlplate for new device first check SNMPv2-MIB::sysORID OID.
If SNMP agend support is correctly implemented vector of the OIDs beneath SNMPv2-MIB::sysORID should return list of the MIBs handled by SNMP agent.

Example output:
```
$ snmpwalk -v1 -c public 192.168.1.1 SNMPv2-MIB::sysORID
SNMPv2-MIB::sysORID.1 = OID: SNMPv2-MIB::snmpMIB
SNMPv2-MIB::sysORID.2 = OID: SNMP-VIEW-BASED-ACM-MIB::vacmBasicGroup
SNMPv2-MIB::sysORID.3 = OID: TCP-MIB::tcpMIB
SNMPv2-MIB::sysORID.4 = OID: IP-MIB::ip
SNMPv2-MIB::sysORID.5 = OID: UDP-MIB::udpMIB
SNMPv2-MIB::sysORID.6 = OID: SNMP-FRAMEWORK-MIB::snmpFrameworkMIBCompliance
SNMPv2-MIB::sysORID.7 = OID: SNMP-MPD-MIB::snmpMPDCompliance
SNMPv2-MIB::sysORID.8 = OID: SNMP-USER-BASED-SM-MIB::usmMIBCompliance

```
Handling all OIDs defined in exact MIB is not mandatory so starting work on monitoring new device you should check as well what is possible to minitor. You can do this using command like below:
```
$ snmpwalk -v1 -c public 192.168.1.1 | awk -F= '{print $1}' | awk -F. '{print $1}' | uniq | sort
DISMAN-EVENT-MIB::sysUpTimeInstance 
IF-MIB::ifAdminStatus
IF-MIB::ifDescr
IF-MIB::ifIndex
IF-MIB::ifInDiscards
IF-MIB::ifInErrors
IF-MIB::ifInOctets
IF-MIB::ifInUcastPkts
IF-MIB::ifMtu
IF-MIB::ifNumber
IF-MIB::ifOperStatus
IF-MIB::ifOutDiscards
IF-MIB::ifOutErrors
IF-MIB::ifOutOctets
IF-MIB::ifOutQLen
IF-MIB::ifOutUcastPkts
IF-MIB::ifPhysAddress
IF-MIB::ifSpecific
IF-MIB::ifSpeed
IF-MIB::ifType
IP-MIB::icmpInAddrMaskReps
IP-MIB::icmpInAddrMasks
IP-MIB::icmpInDestUnreachs
IP-MIB::icmpInEchoReps
IP-MIB::icmpInEchos
IP-MIB::icmpInErrors
IP-MIB::icmpInMsgs
IP-MIB::icmpInParmProbs
IP-MIB::icmpInRedirects
IP-MIB::icmpInSrcQuenchs
IP-MIB::icmpInTimeExcds
IP-MIB::icmpInTimestampReps
IP-MIB::icmpInTimestamps
IP-MIB::icmpOutAddrMaskReps
IP-MIB::icmpOutAddrMasks
IP-MIB::icmpOutDestUnreachs
IP-MIB::icmpOutEchoReps
IP-MIB::icmpOutEchos
IP-MIB::icmpOutErrors
IP-MIB::icmpOutMsgs
IP-MIB::icmpOutParmProbs
IP-MIB::icmpOutRedirects
IP-MIB::icmpOutSrcQuenchs
IP-MIB::icmpOutTimeExcds
IP-MIB::icmpOutTimestampReps
IP-MIB::icmpOutTimestamps
IP-MIB::ip
IP-MIB::ipAdEntAddr
IP-MIB::ipAdEntBcastAddr
IP-MIB::ipAdEntIfIndex
IP-MIB::ipAdEntNetMask
IP-MIB::ipNetToMediaIfIndex
IP-MIB::ipNetToMediaNetAddress
IP-MIB::ipNetToMediaPhysAddress
IP-MIB::ipNetToMediaType
IP-MIB::ipRoutingDiscards
IPV6-MIB::ipv6DefaultHopLimit
IPV6-MIB::ipv6Forwarding
IPV6-MIB::ipv6IfAdminStatus
IPV6-MIB::ipv6IfDescr
IPV6-MIB::ipv6IfEffectiveMtu
IPV6-MIB::ipv6IfLowerLayer
IPV6-MIB::ipv6IfOperStatus
IPV6-MIB::ipv6IfPhysicalAddress
IPV6-MIB::ipv6Interfaces
NOTIFICATION-LOG-MIB::nlmConfigGlobalAgeOut
NOTIFICATION-LOG-MIB::nlmConfigGlobalEntryLimit
NOTIFICATION-LOG-MIB::nlmLogDateAndTime
NOTIFICATION-LOG-MIB::nlmLogTime
NOTIFICATION-LOG-MIB::nlmStatsGlobalNotificationsBumped
NOTIFICATION-LOG-MIB::nlmStatsGlobalNotificationsLogged
SNMPv2-MIB::snmpEnableAuthenTraps
SNMPv2-MIB::snmpInASNParseErrs
SNMPv2-MIB::snmpInBadCommunityNames
SNMPv2-MIB::snmpInBadCommunityUses
SNMPv2-MIB::snmpInBadValues
SNMPv2-MIB::snmpInBadVersions
SNMPv2-MIB::snmpInGenErrs
SNMPv2-MIB::snmpInGetNexts
SNMPv2-MIB::snmpInGetRequests
SNMPv2-MIB::snmpInGetResponses
SNMPv2-MIB::snmpInNoSuchNames
SNMPv2-MIB::snmpInPkts
SNMPv2-MIB::snmpInReadOnlys
SNMPv2-MIB::snmpInSetRequests
SNMPv2-MIB::snmpInTooBigs
SNMPv2-MIB::snmpInTotalReqVars
SNMPv2-MIB::snmpInTotalSetVars
SNMPv2-MIB::snmpInTraps
SNMPv2-MIB::snmpOutBadValues
SNMPv2-MIB::snmpOutGenErrs
SNMPv2-MIB::snmpOutGetNexts
SNMPv2-MIB::snmpOutGetRequests
SNMPv2-MIB::snmpOutGetResponses
SNMPv2-MIB::snmpOutNoSuchNames
SNMPv2-MIB::snmpOutPkts
SNMPv2-MIB::snmpOutSetRequests
SNMPv2-MIB::snmpOutTooBigs
SNMPv2-MIB::snmpOutTraps
SNMPv2-MIB::snmpProxyDrops
SNMPv2-MIB::snmpSilentDrops
SNMPv2-MIB::sysContact
SNMPv2-MIB::sysDescr
SNMPv2-MIB::sysLocation
SNMPv2-MIB::sysName
SNMPv2-MIB::sysObjectID
SNMPv2-MIB::sysORDescr
SNMPv2-MIB::sysORID
SNMPv2-MIB::sysORLastChange
SNMPv2-MIB::sysORUpTime
SNMPv2-MIB::sysServices
SNMPv2-SMI::mib-2
SNMPv2-SMI::mib-2
SNMPv2-SMI::transmission
TCP-MIB::tcpConnLocalAddress
TCP-MIB::tcpConnLocalPort
TCP-MIB::tcpConnRemAddress
TCP-MIB::tcpConnRemPort
TCP-MIB::tcpConnState
TCP-MIB::tcpInErrs
TCP-MIB::tcpOutRsts
UDP-MIB::udpLocalAddress
UDP-MIB::udpLocalPort
```
