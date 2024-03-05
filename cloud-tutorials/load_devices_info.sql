-- CrateDB Example Datasets
-- https://github.com/crate/cratedb-datasets

CREATE TABLE IF NOT EXISTS {table} (
   "device_id" TEXT,
   "api_version" TEXT,
   "manufacturer" TEXT,
   "model" TEXT,
   "os_name" TEXT
);

COPY {table}
FROM 'https://github.com/crate/cratedb-datasets/raw/main/cloud-tutorials/devices_info.json.gz'
WITH (compression='gzip', empty_string_as_null=true)
RETURN SUMMARY;

REFRESH TABLE {table}
