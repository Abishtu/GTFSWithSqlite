CREATE TABLE IF NOT EXISTS agency(
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    url TEXT NOT NULL,
    lang TEXT,
    phone TEXT,
    fare_url TEXT,
    email TEXT,
    cemv_support INTEGER
);

CREATE TABLE IF NOT EXISTS stops(
    id TEXT PRIMARY KEY,
    code TEXT,
    name TEXT NOT NULL,
    tts_stop_name TEXT,
    desc TEXT,
    lat REAL NOT NULL,
    lon REAL NOT NULL,
    zone_id TEXT,
    url TEXT,
    location_type INTEGER NOT NULL,
    parent_station INTEGER,
    FOREIGN KEY(parent_station) REFERENCES stops(id)
);