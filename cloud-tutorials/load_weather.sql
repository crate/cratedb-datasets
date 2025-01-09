-- CrateDB Example Datasets
-- https://github.com/crate/cratedb-datasets

CREATE TABLE IF NOT EXISTS {table} (
    "timestamp" TIMESTAMP,
    "location" VARCHAR,
    "temperature" DOUBLE,
    "humidity" DOUBLE,
    "wind_speed" DOUBLE
);

COPY {table}
FROM 'https://cdn.crate.io/downloads/datasets/cratedb-datasets/cloud-tutorials/data_weather.csv.gz'
WITH (format='csv', compression='gzip', empty_string_as_null=true);

REFRESH TABLE {table};
