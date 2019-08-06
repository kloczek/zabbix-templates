#### Version: 1.0.4 (2018-06-11)

#### Description:
Base Linux monitoring template.

#### Notes:
- compliant with EL7, OL7, Ubuntu (Xenial, Bionic)
- documentation:
  - https://www.kernel.org/doc/Documentation/filesystems/proc.txt

#### Changelog:
- (devel):
  - Items:
    - ```NET::segments retransmitted``` sed regexp changed to cover old "segments retransmited"
      output as well
    - replace ```SYS::rh-distribution``` by ```SYS::os-release``` which grabs the content of the
      ```/etc/os-releases``` using ```vfs.file.contents[/etc/os-release]``` key
      (this will be wortking on all LSB compliant distributions)
    - ```HW::CPU```` item key changed from ```system.hw.cpu``` to ```system.hw.cpu[,model]```
      because this option doesws not include current CPU frequency (which is constantly changing)
    - removed monitoring sshd, crond and rsyslogd as monitoring of those processes
      is not essential and will be provided in separated template(s)
    - ```DSK:``` LLD items Application changed from ```DSK``` prototype ```DSK::{#DISK}```
    - ```NET:``` LLD items Application changed from ```NET``` prototype ```NET::{#FSNAME}```
    - ```VOL:``` LLD items Application changed from ```VOL``` prototype ```VOL::{#FSNAME}```
    - make template zabbix 4.0.x ready by remove using $1-$9 macros in items names
    - new MEM:: metrics:
      - ```MEM::active```
      - ```MEM::anon```
      - ```MEM::inactive```
      - ```MEM::slab```
    - ```MEM::total`` history period changed to 1h as "Discard unchanged" filter preprocessor cannot be used for now
      https://support.zabbix.com/browse/ZBX-16456
    - Graphs:
      - new graph ```MEM::active vs inactive```
  - LLD:
    - rewrited ```VOL``` triggers to use proper severities and triggers prototypes dependencies
    - LXC monitoring adaptations:
      - add in ```VOL:``` LLD filter off all volumes mounted under /var/lib/lxc. If ```OS Linux```
        template will used inside of each LXC container it will provide proper not duplicated
        monirtoring of the LXC container volumes
    - Added 4th level of the alarm in ```VOL::{#FSNAME}::free {ITEM.VALUE}``` LLD trigger
      Now alarms are raised <1%, <%5, <10% and now <20% free volume space
    - ```DSK:``` filter: corrected to get reed of loop devices. Use ```^loop.[0-9]``` instead ```^loop```
    - ```DSK:``` filter: remove from the list of moniitored block devices ZFS vdevs partitions and
      corrected regexp to remove all SCSI partitions
    - ```VOL:``` ``{#FSNAME}::total``` and ```{#FSNAME}::inodes::total``` history period changed to 1h
      as "Discard unchanged" filter preprocessor cannot be used for now
      https://support.zabbix.com/browse/ZBX-16456
  - Screens:
    - new ```DSK, NET``` screen added
    - add to ```MEM``` screen ```MEM::active vs inactive``` graph
  - Triggers:
    - ```SYS::Host is down``` corrected descrition
    - ```CPU::idle``` trigger now uses macros:
      ```{$OS_CPU_IDLE}```: threshold below which is raised alarm about low ```CPU::idle time```&#13;
      ```{$OS_CPU_IDLE_HIST}```: hysteresis time for ```CPU::idle``` after which alarm starts and recovers after additional period defined in ```{$OS_CPU_IDLE_HIST}```</description>
      If those macros are not defined in system macros alarms about low ```CPU::idle time``` will be not created
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
