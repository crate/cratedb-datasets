-- CrateDB Example Datasets
-- https://github.com/crate/cratedb-datasets

CREATE TABLE IF NOT EXISTS {table} (
   "ts" TIMESTAMP WITH TIME ZONE,
   "device_id" TEXT,
   "battery" OBJECT(DYNAMIC) AS (
      "level" BIGINT,
      "status" TEXT,
      "temperature" DOUBLE PRECISION
   ),
   "cpu" OBJECT(DYNAMIC) AS (
      "avg_1min" DOUBLE PRECISION,
      "avg_5min" DOUBLE PRECISION,
      "avg_15min" DOUBLE PRECISION
   ),
   "memory" OBJECT(DYNAMIC) AS (
      "free" BIGINT,
      "used" BIGINT
   )
);

COPY {table}
FROM 'https://github.com/crate/cratedb-datasets/raw/main/cloud-tutorials/devices_readings.json.gz'
WITH (compression='gzip', empty_string_as_null=true)
RETURN SUMMARY;

REFRESH TABLE {table}
