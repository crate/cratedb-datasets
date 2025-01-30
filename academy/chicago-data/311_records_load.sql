-- CrateDB Example Datasets
-- https://github.com/crate/cratedb-datasets

CREATE TABLE IF NOT EXISTS {table} (
   srnumber TEXT,
   srtype TEXT,
   srshortcode TEXT,
   createddept TEXT,
   ownerdept TEXT,
   status TEXT,
   origin TEXT,
   createddate TIMESTAMP,
   lastmodifieddate TIMESTAMP,
   closeddate TIMESTAMP,
   week GENERATED ALWAYS AS date_trunc('week', createddate),
   isduplicate BOOLEAN,
   createdhour SMALLINT,
   createddayofweek SMALLINT,
   createdmonth SMALLINT,
   locationdetails OBJECT(DYNAMIC) AS (
       streetaddress TEXT,
       city TEXT,
       state TEXT,
       zipcode TEXT,
       streetnumber TEXT,
       streetdirection TEXT,
       streetname TEXT,
       streettype TEXT,
       communityarea SMALLINT,
       ward SMALLINT,
       policesector SMALLINT,
       policedistrict SMALLINT,
       policebeat SMALLINT,
       precinct SMALLINT,
       latitude DOUBLE PRECISION,
       longitude DOUBLE PRECISION,
       location GEO_POINT
   )
) PARTITIONED BY (week);

COPY {table}
FROM 'https://cdn.crate.io/downloads/datasets/cratedb-datasets/academy/chicago-data/311_records_apr_2024.json.gz'
WITH (compression='gzip') RETURN SUMMARY;

REFRESH TABLE {table};
