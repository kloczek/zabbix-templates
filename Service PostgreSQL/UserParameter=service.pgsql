UserParameter=service.pgsql.version[*],/usr/bin/psql -U monitoring -qAtX postgres -c "SELECT version();"
UserParameter=service.pgsql.discovery.db,/usr/bin/psql -U monitoring -qAtX postgres -c "SELECT json_agg(row_to_json(row)) FROM (SELECT datname AS \"{#DB}\", datallowconn AS \"{#DATALLOWCONN}\", datistemplate as \"{#DATISTEMPLATE}\" FROM pg_catalog.pg_database ORDER BY 1) row;"
UserParameter=service.pgsql.db.stats[*],/usr/bin/psql -U monitoring -qAtX postgres -c "SELECT row_to_json(row) FROM (SELECT *, pg_database_size('$1') FROM pg_stat_database WHERE datname = '$1') row;
