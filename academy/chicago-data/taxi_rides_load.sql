-- CrateDB Example Datasets
-- https://github.com/crate/cratedb-datasets

CREATE TABLE IF NOT EXISTS {table} (
   tripid TEXT,
   vehicleid INTEGER,
   starttime TIMESTAMP,
   endtime TIMESTAMP,
   duration INTEGER,
   miles DOUBLE PRECISION,
   pickupcommunityarea SMALLINT,
   dropoffcommunityarea SMALLINT,
   fare DOUBLE PRECISION,
   tips DOUBLE PRECISION,
   tolls DOUBLE PRECISION,
   extras DOUBLE PRECISION,
   totalcost DOUBLE PRECISION,
   paymenttype TEXT,
   company TEXT,
   pickupcentroidlatitude DOUBLE PRECISION,
   pickupcentroidlongitude DOUBLE PRECISION,
   pickupcentroidlocation GEO_POINT,
   dropoffcentroidlatitude DOUBLE PRECISION,
   dropoffcentroidlongitude DOUBLE PRECISION,
   dropoffcentroidlocation GEO_POINT
);


COPY {table}
FROM 'https://cdn.crate.io/downloads/datasets/cratedb-datasets/academy/chicago-data/taxi_rides_apr_2024.json.gz'
WITH (compression='gzip')
RETURN SUMMARY;

REFRESH TABLE {table};
