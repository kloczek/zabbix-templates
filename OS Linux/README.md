#### Version: 1.0.4 (2018-06-11)

#### Description:
Base Linux monitoring template.

#### Changelog:
- 1.0.4 (2018-06-11)
  - Graphs:
    - change all graphs resolution to 1200x300
  - Items:
    - added ```MEM::``` items descriptions
    - fixed ```NET::segments retransmitted``` item
      use new sed regexp in this item:
      ```s/\( *\)\(.*\) segments retransmitted*/\2/ p/```
  - Triggers:
    - fixed typo in name: s/SYS:uname changed/```SYS::uname changed```/
    - rename "Lack of free memory" to ```MEM::free {ITEM.LASTVALUE}```
    - use ```diff()```=1 function (instead ```change()``` and ```str()```) in triggers:
      - ```HW::devices list has been changed```
      - ```HW::CPU info has changed```
- 1.0.3 (2017-12-05):
  - LLDs:
    - VOL: fixed typo in /run/media filter
- 1.0.2 (2017-11-30):
  - Items:
    - removed NET::Other TCP timeouts (netstat no longer provides such data)
    - fix: corrected sed regexp in NET::segments retransmitted
  - LLDs:
    - NIC: added missing "^" in filter which has been causing not filter off about lo interface
    - VOL: added filter remove all volumes mounted in /run/media
    - execute all LLD every 10m
  - moved temmplate Changelog to README.md and added temlate URL in description
- 1.0.1 (2017-10-15):
  - Applications:
    - added HW
  - Items:
    - SYS::CPU - monitor CPUs description data using system.hw.cpu[]
    - SYS::devices - monitor list of the devices using system.hw.devices[]
    - renamed SYS::CPU::cores -> HW::CPU::cores and moved to HW application
  - Triggers:
    - added "HW::CPU has changed"
    - added "HW::devices has changed"
  - remove using @OS Linux::NET regexp network interfaces filter and replace by regexp "(?!(lo))" (removed global regexp dependency)
- 1.0.0:
  - initial version

#### Notes:
- compliant with EL7 and compatible
- documentation:
  - https://www.kernel.org/doc/Documentation/filesystems/proc.txt