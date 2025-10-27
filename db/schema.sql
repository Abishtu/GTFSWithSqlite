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

CREATE TABLE IF NOT EXISTS routes(
    id TEXT PRIMARY KEY,
    agency_id TEXT,
    short_name TEXT NOT NULL,
    long_name TEXT NOT NULL,
    desc TEXT,
    type INTEGER NOT NULL ON CONFLICT REPLACE DEFAULT 0,
    color TEXT,
    text_color TEXT,
    sort_order INTEGER,
    continuous_pickup INTEGER,
    continuous_drop_off INTEGER,
    network_id TEXT,
    cemv_support INTEGER,
    FOREIGN KEY(agency_id) REFERENCES agency(id)
);

CREATE TABLE IF NOT EXISTS calendar(
    service_id TEXT PRIMARY KEY,
    monday INTEGER NOT NULL,
    tuesday INTEGER NOT NULL,
    wednesday INTEGER NOT NULL,
    thursday INTEGER NOT NULL,
    friday INTEGER NOT NULL,
    saturday INTEGER NOT NULL,
    sunday INTEGER NOT NULL,
    start_date REAL NOT NULL,
    end_date REAL NOT NULL
);

CREATE TABLE IF NOT EXISTS calendar_dates(
    service_id TEXT NOT NULL,
    date REAL NOT NULL,
    exception_type INTEGER NOT NULL,
    FOREIGN KEY(service_id) REFERENCES calendar(service_id)
    PRIMARY KEY(service_id, date)
);

CREATE TABLE IF NOT EXISTS shapes(
    id TEXT NOT NULL,
    pt_sequence INTEGER NOT NULL,
    pt_lat REAL NOT NULL,
    pt_lon REAL NOT NULL,
    PRIMARY KEY(id, pt_sequence)
);

CREATE TABLE IF NOT EXISTS trips(
    id TEXT PRIMARY KEY,
    route_id TEXT,
    service_id TEXT,
    headsign TEXT,
    short_name TEXT,
    direction_id INTEGER,
    block_id TEXT,
    shape_id INTEGER,
    wheelchair_accessible INTEGER,
    bikes_allowed INTEGER,
    cars_allowed INTEGER,
    FOREIGN KEY(shape_id) REFERENCES shapes(id),
    FOREIGN KEY(service_id) REFERENCES calendar(service_id),
    FOREIGN KEY(route_id) REFERENCES routes(id)
);

CREATE TABLE IF NOT EXISTS stop_times(
    trip_id TEXT NOT NULL,
    stop_sequence INTEGER NOT NULL,
    arrival_time REAL,
    departure_time REAL,
    stop_id TEXT,
    pickup_type INTEGER,
    drop_off_type INTEGER,
    FOREIGN KEY(stop_id) REFERENCES stops(id),
    FOREIGN KEY(trip_id) REFERENCES trips(id),
    PRIMARY KEY(trip_id, stop_sequence)
);