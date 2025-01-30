-- CrateDB Example Datasets
-- https://github.com/crate/cratedb-datasets

CREATE TABLE IF NOT EXISTS {table} (
   areanumber INTEGER PRIMARY KEY,
   name TEXT,
   details OBJECT(DYNAMIC) AS (
       description TEXT INDEX USING fulltext WITH (analyzer='english'),
       description_vec FLOAT_VECTOR(2048),
       population BIGINT
   ),
   boundaries GEO_SHAPE INDEX USING geohash WITH (PRECISION='1m', DISTANCE_ERROR_PCT=0.025)
);

COPY {table}
FROM 'https://cdn.crate.io/downloads/datasets/cratedb-datasets/academy/chicago-data/chicago_community_areas_with_vectors.json'
RETURN SUMMARY;

REFRESH TABLE {table};
