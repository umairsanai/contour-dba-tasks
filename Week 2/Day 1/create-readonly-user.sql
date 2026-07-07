CREATE USER umair_readonly WITH PASSWORD 'umairanwar';

GRANT USAGE ON SCHEMA public TO umair_readonly;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO umair_readonly;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO umair_readonly;