-- CrateDB Example Datasets
-- https://github.com/crate/cratedb-datasets

CREATE TABLE IF NOT EXISTS {table} (
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

COPY {table}
FROM 'https://cdn.crate.io/downloads/datasets/cratedb-datasets/cloud-tutorials/data_marketing.json.gz'
WITH (format = 'json', compression='gzip');

REFRESH TABLE {table};
