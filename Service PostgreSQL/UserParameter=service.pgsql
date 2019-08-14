UserParameter=service.pgsql.version[*],/usr/bin/psql -U monitoring -qAtX postgres -c "SELECT version();"
UserParameter=service.pgsql.discovery.db,/usr/bin/psql -U monitoring -qAtX postgres -c "SELECT json_agg(row_to_json(row)) FROM (SELECT datname, datallowconn, datistemplate FROM pg_catalog.pg_database ORDER BY 1)
row;"
