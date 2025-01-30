-- CrateDB Example Datasets
-- https://github.com/crate/cratedb-datasets

CREATE TABLE IF NOT EXISTS {table} (
    "measurementid" TEXT,
    "station" TEXT,
    "ts" TIMESTAMP WITH TIME ZONE,
    "airtemp" DOUBLE PRECISION,
    "wetbulbtemp" DOUBLE PRECISION,
    "humidity" SMALLINT,
    "rainintensity" DOUBLE PRECISION,
    "intervalrain" DOUBLE PRECISION,
    "totalrain" DOUBLE PRECISION,
    "precipitationtype" SMALLINT,
    "winddirection" SMALLINT,
    "windspeed" DOUBLE PRECISION,
    "maxwindspeed" DOUBLE PRECISION,
    "pressure" DOUBLE PRECISION,
    "solarradiation" SMALLINT,
    "batterylife" DOUBLE PRECISION
);

COPY {table}
FROM 'https://cdn.crate.io/downloads/datasets/cratedb-datasets/academy/chicago-data/beach_weather_station_data.csv'
WITH (format='csv', empty_string_as_null=true) RETURN SUMMARY;

REFRESH TABLE {table};
