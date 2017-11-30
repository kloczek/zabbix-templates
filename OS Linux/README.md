Base Linux monitoring template compliant with EL7 and compatible.

Version: 1.0.1 (2017-11-30)

Notes:

Changelog:
1.0.2 (2017-11-30):
- removed NET::Other TCP timeouts (netstat no longer provides such data)
- fix: corrected sed regexp in NET::segments retransmitted
- fix: added missing "^" in NIC: LLD filter which has been causing not filter off about lo interface
- in VOL: LLD filter added remove all volumes mounted in /run/media
- execute all LLD every 10m
- moved temmplate Changelog to README.md and added temlate URL in description

1.0.1 (2017-10-15):
- added HW applicatiom
- added items in HW application:
 - SYS::CPU - monitor CPUs description data using system.hw.cpu[]
 - SYS::devices - monitor list of the devices using system.hw.devices[]
- renamed item:
 - SYS::CPU::cores to HW::CPU::cores and moved to HW application
- added triggers 
 - HW::CPU has changed
 - HW::devices has changed
- remove using @OS Linux::NET regexp network interfaces filter and replace by regexp "(?!(lo))" (removed global regexp dependency)

1.0:
- initial version.
