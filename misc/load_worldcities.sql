CREATE TABLE IF NOT EXISTS "cities" (
  "city" TEXT,
  "city_ascii" TEXT INDEX USING FULLTEXT WITH (analyzer = 'standard'),
  "lat" DOUBLE PRECISION,
  "lng" DOUBLE PRECISION,
  "country" TEXT,
  "iso2" TEXT,
  "iso3" TEXT,
  "admin_name" TEXT,
  "capital" TEXT,
  "population" BIGINT,
  "id" BIGINT
)