# UK Offshore Wind Farms Dataset

This dataset contains data about UK offshore windfarms from [The Crown Estate](https://www.thecrownestate.co.uk/en-gb/what-we-do/asset-map/), which manages these installations.  The textual descriptions of each wind farm project are from Wikipedia (see: [List of offshore wind farms in the United Kingdom](https://en.wikipedia.org/wiki/List_of_offshore_wind_farms_in_the_United_Kingdom)).

## Wind Farm Data

### wind_farms.json

This JSONL file contains details of each offshore wind farm.  These include an ID for the wind farm, name, description, and geo data in WKT format describing the boundaries of the project as one or more polygons.  The co-ordinates of each turbine are also included, where known.
 
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

TODO information about mappings to the <TODO GENERATION> file.

Here's an example table schema for this data:

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

## TODO Generation Type Data

TODO

```json
TODO
```

TODO information about mappings to the `wind_farms.json` file.

Here's an example table schema for this data:

```sql
CREATE TABLE windfarm_output (
   windfarmid TEXT,
   ts TIMESTAMP WITHOUT TIME ZONE,
   month TIMESTAMP WITH TIME ZONE GENERATED ALWAYS AS date_trunc('month', ts),
   output DOUBLE PRECISION,
   outputpercentage DOUBLE PRECISION
) PARTITIONED BY (month);
```
