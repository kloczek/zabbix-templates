#### Version: 1.0.4 (2018-06-11)

#### Description:
Base OS Solaris monitoring.

#### Changelog:
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
