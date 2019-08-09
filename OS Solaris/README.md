#### Version: 1.0.4 (2018-06-11)

#### Description:
Base OS Solaris monitoring.

#### Notes:
- https://github.com/mharsch/arcstat/blob/master/arcstat.pl
- http://dtrace.org/blogs/brendan/2012/01/09/activity-of-the-zfs-arc/
- Possible to add kstat ARC metrics:
```
zfs:0:arcstats:buf_size
zfs:0:arcstats:class
zfs:0:arcstats:crtime
zfs:0:arcstats:data_size
zfs:0:arcstats:deleted
zfs:0:arcstats:evict_l2_cached
zfs:0:arcstats:evict_l2_eligible
zfs:0:arcstats:evict_l2_ineligible
zfs:0:arcstats:evict_mfu
zfs:0:arcstats:evict_mru
zfs:0:arcstats:hash_chain_max
zfs:0:arcstats:hash_chains
zfs:0:arcstats:hash_collisions
zfs:0:arcstats:hash_elements
zfs:0:arcstats:hash_elements_max
zfs:0:arcstats:l2_abort_lowmem
zfs:0:arcstats:l2_cksum_bad
zfs:0:arcstats:l2_evict_lock_retry
zfs:0:arcstats:l2_evict_reading
zfs:0:arcstats:l2_feeds
zfs:0:arcstats:l2_hdr_size
zfs:0:arcstats:l2_io_error
zfs:0:arcstats:l2_read_bytes
zfs:0:arcstats:l2_rw_clash
zfs:0:arcstats:l2_size
zfs:0:arcstats:l2_write_bytes
zfs:0:arcstats:l2_writes_done
zfs:0:arcstats:l2_writes_error
zfs:0:arcstats:l2_writes_hdr_miss
zfs:0:arcstats:l2_writes_sent
zfs:0:arcstats:meta_limit
zfs:0:arcstats:meta_max
zfs:0:arcstats:meta_used
zfs:0:arcstats:mutex_miss
zfs:0:arcstats:other_size
zfs:0:arcstats:p
zfs:0:arcstats:snaptime
```
- https://github.com/bcantrill/node-kstat

#### Changelog:
- (devel):
  - Applications:
    - remove using ```DSK```, ```NET``` and ```VOL``` Applications and replace them by LLD prototypes
      ```DSK::{#DISK}```, ```NET::{#IFNAME}``` and ```VOL::{#FSNAME}```
  - Items:
    - removed monitoring sshd, crond and rsyslogd as monitoring of those processes
      is not essential and will be provided in separated template(s)
    - make template zabbix 4.0.x ready by remove using $1-$9 macros in items names
    - copy the same set of 6 NET item LLD prototypes as in ```OS Linux``` template
      to cover monitoring in/out traffic in packets and bytes and errors and dropped
      packets as well
    - changed ```VOL:``` LLD items Application from fixed ```VOL``` to per volume ```VOL::{#FSNAME}```
      and added LLD VOL items descriptions
  - Triggers:
    - removed duplicated ```SYS::Host is down``` trigger
    - added ```SYS::Host is down```
    - added ```CPU::idle {ITEM.VALUE}```
    - ```CPU::idle``` trigger now uses macros:
      ```{$OS_CPU_IDLE}```: threshold below which is raised alarm about low ```CPU::idle time```&#13;
      ```{$OS_CPU_IDLE_HIST}```: hysteresis time for ```CPU::idle``` after which alarm starts and recovers after additional period defined in ```{$OS_CPU_IDLE_HIST}```</description>
      If those macros are not defined in system macros alarms about low ```CPU::idle time``` will be not created
    - Add proper dependency for all trigges which still does not depend on ```SYS::Host is down```
- 1.0.4 (2018-06-11)
  - Triggers:
    - fixed typo in trigger name s/SYS:uname changed/```SYS::uname changed```/
    - added ```MEM::free {ITEM.LASTVALUE}```
- 1.0.1 (2017-12-01):
  - execute all LLD every 10m
  - channge default history perid to 2w
  - moved some parts of the template description to README.md
- 1.0.0 (2017-09-09):
  - initial version.
