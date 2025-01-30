-- CrateDB Example Datasets
-- https://github.com/crate/cratedb-datasets

CREATE TABLE IF NOT EXISTS {table} (
   vehicleid INTEGER,
   status TEXT,
   make TEXT,
   model TEXT,
   modelyear INTEGER,
   color TEXT,
   fuel TEXT,
   wheelchairaccessible BOOLEAN,
   operator TEXT,
   zipcode TEXT,
   affiliation TEXT,
   medallion TEXT
);

COPY {table}
FROM 'https://cdn.crate.io/downloads/datasets/cratedb-datasets/academy/chicago-data/taxi_details.csv'
RETURN SUMMARY;

REFRESH TABLE {table};
