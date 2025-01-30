-- CrateDB Example Datasets
-- https://github.com/crate/cratedb-datasets

CREATE TABLE IF NOT EXISTS {table} (
    stationid TEXT,
    location GEO_POINT,
    additionalinfo OBJECT(STRICT) AS (
        altitude SMALLINT,
        manager TEXT,
        established SMALLINT
    )
);

INSERT INTO {table} (stationid, location, additionalinfo) VALUES
('Foster', 'POINT(-87.647525 41.976464)', '{{"altitude": 179, "manager": "Chicago Park District", "established": 2003}}'),
('Oak Street', 'POINT(-87.6228169 41.901997)', '{{"altitude": 185, "manager": "Chicago Park District", "established": 2001}}');

REFRESH TABLE {table};
