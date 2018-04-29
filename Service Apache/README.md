#### Version: 1.0.1 (2017-12-01)

#### Description:
Apache service monitoring template using zabbix active agent items.

#### Changelog:
- 1.0.1 (2017-12-01):
  - channge default history perid to 2w
  - moved some parts of the template description to README.md
  - added items:
     - ServerMPM
     - ServerVersion
  - use ServerUptimeSeconds in uptime item
- 1.0.0 (2017-09-09):
  - initial version

#### Notes:
- This template uses apache mod_status metrics.
- To allow use this template in apache configuration must be present:
```
ExtendedStatus On
<Location /server-status>
            SetHandler server-status
            Order deny,allow
            Deny from all
            Allow from localhost
</Location>
```