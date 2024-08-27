# UK Offshore Wind Farms Dataset

This dataset contains data about UK offshore windfarms from [The Crown Estate](https://www.thecrownestate.co.uk/en-gb/what-we-do/asset-map/), which manages these installations.  The textual descriptions of each wind farm project are from Wikipedia (see: [List of offshore wind farms in the United Kingdom](https://en.wikipedia.org/wiki/List_of_offshore_wind_farms_in_the_United_Kingdom)).

## Wind Farm Data

### wind_farms.json

This JSONL file contains details of 45 offshore wind farms.  Each record includes an ID for the wind farm, name, description, and geo data in WKT format describing the boundaries of the project as one or more polygons.  The co-ordinates of each turbine are also included, where known.
 
Each line in the file contains a JSON object with this structure:

```json
{
    "id": "TRTNK", 
    "name": "Triton Knoll", 
    "description": "Triton Knoll Wind Farm is an 857 MW...",
    "location": "POINT (0.840000 53.480000)", 
    "territory": "England", 
    "boundaries": "POLYGON ((0.87630538600007 53.4262737870001, ...))", 
    "turbines": {
        "brand": "MHI Vestas", 
        "model": "MHI Vestas v164-9.5", 
        "locations": ["POINT (53.4212466 0.9478282)", ...], 
        "howmany": 90
    }, 
    "capacity": 857.0, 
    "url": "https://en.wikipedia.org/wiki/Triton_Knoll"
}
```

* `id` is a unique ID for each wind farm.  These IDs are used as values for `windfarmid` in the performance data file.
* `location` is a singular point identifying the location of the wind farm.
* `boundaries` is a polygon or multi polygon describing the outer boundaries of the wind farm.
* `capacity` is measured in MW.

Here's an example table schema for this data, using full text indexing for the textual descriptions of each wind farm:

```sql
CREATE TABLE windfarms (
    id TEXT PRIMARY KEY,
    name TEXT,
    description TEXT INDEX USING fulltext WITH (analyzer='english'),
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
```

## Wind Farm Performance Data

### wind_farm_output.json.gz

This compressed JSONL file forms the second part of this dataset. It contains data relating to the power output of each wind farm on an hourly basis.  The data in this file covers the period TODO to TODO and contains TODO records. 

Each line of the file contains a JSON object with this structure:

```json
{
    "windfarmid": "SEGRN-1",
    "ts": 1724342400000,
    "output": 981.6,
    "outputpercentage": 91.31
}
```

* `windfarmid` is the ID of the wind farm that the reading is for.  This maps to a value of `id` in the `windfarms` table.
* `ts` is the UNIX timestamp in milliseconds for when the output reading was taken.
* `output` is the output of the wind farm in MW.
* `outputpercentage` is the percentage of maximum output that the wind farm is operating at.

Here's an example table schema for this data - including a generated column `day` allowing us to partition the data by day:

```sql
CREATE TABLE windfarm_output (
   windfarmid TEXT,
   ts TIMESTAMP WITHOUT TIME ZONE,
   day TIMESTAMP WITH TIME ZONE GENERATED ALWAYS AS date_trunc('day', ts),
   output DOUBLE PRECISION,
   outputpercentage DOUBLE PRECISION
) PARTITIONED BY (day);
```
