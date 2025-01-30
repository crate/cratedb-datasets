-- CrateDB Example Datasets
-- https://github.com/crate/cratedb-datasets

CREATE TABLE IF NOT EXISTS {table} (
   name TEXT,
   location OBJECT(DYNAMIC) AS (
       address TEXT,
       zipcode TEXT,
       communityarea INTEGER,
       position GEO_POINT
   ),
   hours ARRAY(TEXT),
   phone TEXT,
   website TEXT
);

COPY {table}
FROM 'https://cdn.crate.io/downloads/datasets/cratedb-datasets/academy/chicago-data/chicago_libraries.json'
RETURN SUMMARY;

REFRESH TABLE {table};
