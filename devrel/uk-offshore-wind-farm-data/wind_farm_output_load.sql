-- CrateDB Example Datasets
-- https://github.com/crate/cratedb-datasets

CREATE TABLE IF NOT EXISTS {table} (
    windfarmid TEXT,
    ts TIMESTAMP WITHOUT TIME ZONE,
    month GENERATED ALWAYS AS date_trunc('month', ts),
    day TIMESTAMP WITH TIME ZONE GENERATED ALWAYS AS date_trunc('day', ts),
    output DOUBLE PRECISION,
    outputpercentage DOUBLE PRECISION
) PARTITIONED BY (day);

COPY {table}
FROM 'https://cdn.crate.io/downloads/datasets/cratedb-datasets/devrel/uk-offshore-wind-farm-data/wind_farm_output.json.gz'
WITH (compression='gzip')
RETURN SUMMARY;

REFRESH TABLE {table};
