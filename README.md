Zabbix templates
----------------

List of templates:


Notes:
* If it is something which nees to be done do use those teplates it is described in each template description notes
* Each template in description has last modyfication date and internal version


Template iitems, applications and triggers naming convention:
* Each item, application and trigger name has ecact patter in name like
  <CLASS>{::<suclass]::Name
  
This is to provide parseable name allowing to distingwush and categorise those object.
Such convension is quite easy to handle as pattern in allarming layer allowing for example send all tigger with SYS:: in the beginning name of the template to exact team.
Such pattern is possible to use part of the general interface on communcation with exaternal services.

* Do not use {HOSTNAME} macros in triggers as web frontnd in teriger list in other colum is name of the host on which trigger is active (it is waste of space on web page)
 
# Copyright (C) 2017 Tomasz Kłoczko <kloczek@fedoraproject.org>
#
# This program is free software, distributed under the terms of
# the GNU General Public License Version 2.
#
