Base Linux monitoring template compliant with EL7 and compatible.

Current version : 1.0.1

Date:             2017-10-15

Notes:

Changelog:
1.0.1:
- added HW applicatiom
- added items in HW application:
 - SYS::CPU - monitor CPUs description data using system.hw.cpu[]
 - SYS::devices - monitor list of the devices using system.hw.devices[]
- renamed item:
 - SYS::CPU::cores to HW::CPU::cores and moved to HW application
- added triggers 
 - HW::CPU has changed
 - HW::devices has changed
- remove using @OS Linux::NET regexp network interfaces filter and replace by regexp "^(?!(lo))" (removed global regexp dependency)

1.0:
- initial version.
