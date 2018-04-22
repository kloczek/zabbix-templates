Base Linux monitoring template.

Version: 1.0.4 (2017-12-21)

Changelog:
- 1.0.4 (not released yet)
  - added MEM::* items descriptions
  - fixed typo in trigger name s/SYS:uname changed/SYS::uname changed/
  - fixed NET::segments retransmitted item
    use new sed regexp in this item: "s/\( *\)\(.*\) segments retransmitted*/\2/ p/"
- 1.0.3 (2017-12-05):
  - fix: typo in /run/media VOL: LLD
- 1.0.2 (2017-11-30):
  - removed NET::Other TCP timeouts (netstat no longer provides such data)
  - fix: corrected sed regexp in NET::segments retransmitted
  - fix: added missing "^" in NIC: LLD filter which has been causing not filter off about lo interface
  - in VOL: LLD filter added to remove all volumes mounted in /run/media
  - execute all LLD every 10m
  - moved temmplate Changelog to README.md and added temlate URL in description
- 1.0.1 (2017-10-15):
  - added HW applicatiom
  - added items in HW application:
    - SYS::CPU - monitor CPUs description data using system.hw.cpu[]
    - SYS::devices - monitor list of the devices using system.hw.devices[]
    - renamed item SYS::CPU::cores to HW::CPU::cores and moved to HW application
  - added triggers
    - HW::CPU has changed
    - HW::devices has changed
  - remove using @OS Linux::NET regexp network interfaces filter and replace by regexp "(?!(lo))" (removed global regexp dependency)
- 1.0.0:
  - initial version

Notes:
- compliant with EL7 and compatible
- documentation:
  - https://www.kernel.org/doc/Documentation/filesystems/proc.txt