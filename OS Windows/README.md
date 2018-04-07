Base OS Windows template.

Version: 1.0.3 (2018-01-26)

Changelog:
- 1.0.3
  - Added TCP and UDP V4 items (ss)
  - Added more items to PROC with descriptions (ss)
  - Added more SIND items and changed all intervals update 1m -> 5m (ss)
  - Removed unused RBC, NLOG and SS applications (storage spaces) (ss)

Changelog:
- 1.0.2
  - Added more items from typeperf counters. (ss)
  - Added more item descriptions (ss)
  - Changed Bitlocker from BITL to BLOC as application name. (ss)
  - Added additional application MEM::CAC, for items specifically related to cached memory (ss)

Changelog:
- 1.0.1 (2017-11-30):
  - added more applications (ss)
  - added items across the board (ss)
  - moved some items (ss)
  - removed Network::ICMP as this metric is now provided by ICMP template (tk)
Changelog:
- 1.0.0:
  - initial version

Notes:

Contributors:
- ss: Scott Simmons
- tk: Tomasz Kłoczko
