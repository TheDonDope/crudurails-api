#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE ROLE crudurails_api WITH CREATEDB LOGIN PASSWORD 'crudurails_api';
    CREATE DATABASE crudurails_api_development;
    CREATE DATABASE crudurails_api_test;
    CREATE DATABASE crudurails_api_production;
    GRANT ALL PRIVILEGES ON DATABASE crudurails_api_development TO crudurails_api;
    GRANT ALL PRIVILEGES ON DATABASE crudurails_api_test TO crudurails_api;
    GRANT ALL PRIVILEGES ON DATABASE crudurails_api_production TO crudurails_api;
EOSQL
