# Dataset Descriptions for Cloud Tutorial Repository

This repository contains three sample datasets specifically curated to help users understand various features and use-cases of CrateDB Cloud. Below are the details for each dataset:


## data_weather.csv.gz

### Overview
This compressed dataset (`data_weather.csv.gz`) is designed to simulate real-time weather readings from CrateDB offices globally.

### Schema
```sql
CREATE TABLE "weather_data" (
    "timestamp" TIMESTAMP,
    "location" VARCHAR,
    "temperature" DOUBLE,
    "humidity" DOUBLE,
    "wind_speed" DOUBLE
);
```

### Attributes
- **timestamp**: The exact time of the weather reading.
- **location**: The location of the weather station.
- **temperature**: Temperature in degrees Celsius.
- **humidity**: Humidity in percentage.
- **wind_speed**: Wind speed in km/h.

---

## data_netflix.csv.gz

### Overview
The dataset (`data_netflix.csv.gz`) enables users to delve into Netflix titles and exploit CrateDB's full-text search capabilities.

### Schema
```sql
CREATE TABLE "netflix_catalog" (
   "show_id" TEXT PRIMARY KEY,
   "type" TEXT,
   "title" TEXT,
   "director" TEXT,
   "cast" ARRAY(TEXT),
   "country" TEXT,
   "date_added" TIMESTAMP,
   "release_year" TEXT,
   "rating" TEXT,
   "duration" TEXT,
   "listed_in"  ARRAY(TEXT),
   "description" TEXT INDEX using fulltext
);
```

### Attributes
- **show_id**: A unique identifier for each title.
- **type**: The format of the title (e.g., Movie, TV Show).
- **title**: The title name.
- **director**: The director of the title.
- **cast**: An array of cast members.
- **country**: The country of production.
- **date_added**: When the title was added.
- **release_year**: The release year of the title.
- **rating**: Content rating (PG, R, etc.).
- **duration**: Duration in minutes or seasons.
- **listed_in**: Genres of the title.
- **description**: Full-text searchable description.

---

## data_marketing.json.gz

### Overview
The `data_marketing.json.gz` dataset captures information about various marketing campaigns.

### Schema
```sql
CREATE TABLE marketing_data (
    campaign_id TEXT PRIMARY KEY,
    source TEXT,
    metrics OBJECT(DYNAMIC) AS (
        clicks INTEGER,
        impressions INTEGER,
        conversion_rate DOUBLE PRECISION
    ),
    landing_page_url TEXT,
    url_parts GENERATED ALWAYS AS parse_url(landing_page_url)
);
```

### Attributes
- **campaign_id**: A unique identifier for the marketing campaign.
- **source**: Source of the campaign (e.g., Google Ads).
- **metrics**: Object containing clicks, impressions, and conversion rate.
- **landing_page_url**: The URL for the landing page.
- **url_parts**: A generated column to automatically parse components of the `landing_page_url`.

## devices_readings.json.gz

### Overview
The `devices_readings.json.gz` dataset cointains information about various readings from devices.

### Schema
```sql
CREATE TABLE devices_readings (
   "ts" TIMESTAMP WITH TIME ZONE,
   "device_id" TEXT,
   "battery" OBJECT(DYNAMIC) AS (
      "level" BIGINT,
      "status" TEXT,
      "temperature" DOUBLE PRECISION
   ),
   "cpu" OBJECT(DYNAMIC) AS (
      "avg_1min" DOUBLE PRECISION,
      "avg_5min" DOUBLE PRECISION,
      "avg_15min" DOUBLE PRECISION
   ),
   "memory" OBJECT(DYNAMIC) AS (
      "free" BIGINT,
      "used" BIGINT
   )
);
```

### Attributes
- **ts**: Timestamp when each reading was taken.
- **device_id**: Identifier of the device.
- **battery**: Object containing battery level, status and temperature.
- **cpu**: Object containing average CPU loads over the last 1, 5 and 15 minutes.
- **memory**: Object containing information about the device's free and used memory.

## devices_info.json.gz

### Overview
The `devices_info.json.gz` dataset stores metadata information about various devices.

### Schema
```sql
CREATE TABLE devices_info (
    "device_id" TEXT,
    "api_version" TEXT,
    "manufacturer" TEXT,
    "model" TEXT,
    "os_name" TEXT
);
```

### Attributes
- **device_id**: Identifier of the device.
- **api_version**: Version of the API that the device supports.
- **manufacturer**: Name of the manufacturer of the device.
- **model**: Model name of the device.
- **os_name**: Name of the operating system running on the device.