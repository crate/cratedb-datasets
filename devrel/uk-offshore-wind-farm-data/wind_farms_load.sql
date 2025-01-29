-- CrateDB Example Datasets
-- https://github.com/crate/cratedb-datasets

CREATE TABLE IF NOT EXISTS {table} (
   id TEXT PRIMARY KEY,
   name TEXT,
   description TEXT INDEX USING fulltext WITH (analyzer='english'),
   description_vec FLOAT_VECTOR(2048),
   location GEO_POINT,
   territory TEXT,
   boundaries GEO_SHAPE INDEX USING geohash WITH (PRECISION='1m', DISTANCE_ERROR_PCT=0.025),
   turbines OBJECT(STRICT) AS (
      brand TEXT,
      model TEXT,
      locations ARRAY(GEO_POINT),
      howmany SMALLINT
   ),
   capacity DOUBLE PRECISION,
   url TEXT
);

COPY {table}
FROM 'https://cdn.crate.io/downloads/datasets/cratedb-datasets/devrel/uk-offshore-wind-farm-data/wind_farms.json'
RETURN SUMMARY;

REFRESH TABLE {table};
