# City of Chicago Dataset

This dataset is used in some of the courses at the [CrateDB Academy](https://learn.cratedb.com). It is based on open data from the [Chicago Data Portal](https://data.cityofchicago.org/) with some adaptations made to suit the purposes of the courses that it appears in.

## Community Areas Data

### chicago_community_areas.json

Chicago is divided into 77 community areas.  This JSONL file contains details of each, with the area's boundaries represented as a GeoJSON MultiPolygon.

Each line in the file contains a JSON object with this structure:

```json
{
    "areanumber":35,
    "name":"DOUGLAS",
    "details": {
        "description":"Text describing the history and characteristics of the area.",
        "population":20291
    },"boundaries": {
        "type":"MultiPolygon",
        "coordinates":[[[[-87.60914087617894,41.84469250265398], ... ]]]
    }
}
```

## Libraries Data

### chicago_libraries.json

This JSONL file contains details about each of the libraries in Chicago. Each line in the file contains a JSON object with this structure:

```json
{
    "name":"Albany Park",
    "location": {
        "address":"3401 W. Foster Ave.",
        "zipcode":"60625",
        "communityarea":13,
        "position":"POINT (-87.71361314512697 41.97557881655979)"
    },
    "hours":["10-5","10-5","CLOSED","10-5","10-5","12-4","CLOSED"],
    "phone":"(773) 539-5450",
    "website":"https://www.chipublib.org/locations/3/"
}
```

* Values for `communityarea` map to values of `areanumber` in the community areas data file.  
* The `hours` array is organized by day, with Monday being the first entry and Sunday the last.  These hours were randomly generated and do not reflect the true opening hours of the library.

## Weather Data

### beach_weather_station_data.csv

This file contains weather data from three weather stations located on Chicago's lake shore in CSV format. The fields are:

* `measurementid`: Unique identifier for the record.
* `station`: Name of the weather station.
* `ts`: Date/time that the observation was recorded.  `YYYY-MM-DDThh:mm:ss-06:00`
* `airtemp`: Air temperature (Celsius).
* `wetbulbtemp`: Wet bulb temperature (Celsius).
* `humidity`: Percentage relative humidity.
* `rainintensity`: Rain intensity mm per hour.
* `intervalrain`: Rain since the last hourly measurement, mm.
* `totalrain`: Total rain since midnight in mm.
* `precipitationtype`: 0 = No precipitation, 60 = Liquid precipitation inc ice/hail, 70 = snow, 40 = unspecified.
* `winddirection`: Wind direction in degrees.
* `windspeed`: Wind speed, metres per second.
* `maxwindspeed`: Maximum wind speed in the two-minute period before the observation was recoded.
* `pressure`: Barometric pressure in hPa.
* `solarradiation`: Solar radiation in watts per square metre.

## 311 Calls Data

### 311_records_apr_2024.json.gz

This file contains details of service requests made to Chicago's 311 non-emergency issue reporting service.  It is in compressed JSONL format.

Each line in the file contains a JSON object with this structure:

```json
{
    "srnumber":"SR24-00581669",
    "srtype":"Street Light Out Complaint",
    "srshortcode":"SFD",
    "createddept":"311 City Services",
    "ownerdept":"CDOT - Department of Transportation",
    "status":"Completed",
    "origin":"Phone Call",
    "createddate":1711948921000,
    "lastmodifieddate":1712056100000,
    "closeddate":1712056100000,
    "isduplicate":false,
    "createdhour":0,
    "createddayofweek":2,
    "createdmonth":4,
    "locationdetails": {
        "streetaddress":"5758 S ALBANY AVE",
        "city":"Chicago",
        "state":"Illinois",
        "zipcode":"",
        "streetnumber":"5758",
        "streetdirection":"S",
        "streetname":"ALBANY",
        "streettype":"AVE",
        "communityarea":63,
        "ward":14,
        "policesector":2,
        "policedistrict":8,
        "policebeat":824,
        "precinct":5,
        "latitude":41.788113692,
        "longitude":-87.700967509,
        "location": [ -87.700967509,41.788113692 ]
    }
}
```

Values for `communityarea` map to values of `areanumber` in the community areas data file.

## Taxi Rides Data

There are two files containing data pertaining to Chicago's taxi fleet and rides taken in April 2024.

### taxi_details.csv

This file contains details of the vehicles making up Chicago's active taxi fleet, in CSV format.  The fields are:

* `vehicleid`: Unique identifier for the vehicle, used in the taxi rides data file.
* `status`: 
* `make`: The name of the manufacturer that made the vehicle.
* `model`: The model name of the vehicle.
* `modelyear`: The model year of the vehicle.
* `color`: The paint colour of the vehicle.
* `fuel`: The type of fuel that the vhicle runs on.
* `wheelchairaccessible`: Whether or not the vehicle is accessible to wheelchair users.
* `operator`: The operating company.
* `zipcode`: The zipcode of the operating company.
* `affiliation`: The name of the affiliate that the vehicle operates for.
* `medallion`: The vehicle's taxi medallion number.


### taxi_rides_apr_2024.json.gz

This file contains details of individual taxi rides taken in April 2024.  It is a compressed JSONL file.

Each line in the file contains a JSON object with this structure:

```json
{
    "tripid":"927535c424b67129b10ea0ef38c7014a1ab9eec3",
    "vehicleid":3879,
    "pickupcommunityarea":6,
    "dropoffcommunityarea":24,
    "paymenttype":"Unknown",
    "company":"Taxi Affiliation Services",
    "pickupcentroidlocation":"POINT (-87.6559981815 41.9442266014)",
    "dropoffcentroidlocation":"POINT (-87.6763559892 41.9012069941)",
    "duration":960,
    "miles":5.4,
    "fare":16.5,
    "tips":0,
    "tolls":0,
    "extras":0,
    "totalcost":16.5,
    "pickupcentroidlatitude":41.944226601,
    "pickupcentroidlongitude":-87.655998182,
    "dropoffcentroidlatitude":41.901206994,
    "dropoffcentroidlongitude":-87.676355989,
    "starttime":1714538700000,
    "endtime":1714539600000
}
```

* Values for `vehicleid` map to `vehicleid` in the taxis data file.
* Values for `pickupcommunityarea` and `dropoffcommunityarea` map to values of `areanumber` in the community areas data file.
