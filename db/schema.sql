CREATE TABLE IF NOT EXISTS `agency`(
    agency_id TEXT,
    agency_name TEXT,
    agency_url TEXT,
    agency_timezone TEXT,
    agency_lang TEXT,
    agency_phone TEXT
);

CREATE TABLE IF NOT EXISTS `calendar_dates`(
    service_id TEXT,
    date TEXT,
    exception_type TEXT
);

CREATE TABLE IF NOT EXISTS `calendar`(
    service_id TEXT,
    monday TEXT,
    tuesday TEXT,
    wednesday TEXT,
    thursday TEXT,
    friday TEXT,
    saturday TEXT,
    sunday TEXT,
    start_date TEXT,
    end_date TEXT
);

CREATE TABLE IF NOT EXISTS `feed_info`(
    feed_publisher_name TEXT,
    feed_publisher_url TEXT,
    feed_lang TEXT,
    feed_start_date TEXT,
    feed_end_date TEXT
);

CREATE TABLE IF NOT EXISTS `routes`(
    route_id TEXT,
    route_short_name TEXT,
    route_long_name TEXT,
    route_desc TEXT,
    route_type TEXT,
    route_url TEXT,
    route_color TEXT,
    route_text_color TEXT
);

CREATE TABLE IF NOT EXISTS `stops`(
    stop_id TEXT,
    stop_code TEXT,
    stop_name TEXT,
    stop_desc TEXT,
    stop_lat TEXT,
    stop_lon TEXT,
    zone_id TEXT,
    stop_url TEXT,
    location_type TEXT,
    parent_station TEXT,
    platform_code TEXT
);

CREATE TABLE IF NOT EXISTS `stop_times`(
    trip_id TEXT,
    arrival_time TEXT,
    departure_time TEXT,
    stop_id TEXT,
    stop_sequence TEXT,
    pickup_type TEXT,
    drop_off_type TEXT
);

CREATE TABLE IF NOT EXISTS `shapes`(
    shape_id TEXT,
    shape_pt_lat TEXT,
    shape_pt_lon TEXT,
    shape_pt_sequence TEXT
);

CREATE TABLE IF NOT EXISTS `trips`(
    route_id TEXT,
    service_id TEXT,
    trip_id TEXT,
    trip_headsign TEXT,
    direction_id TEXT,
    block_id TEXT,
    shape_id TEXT
);

.mode csv

.import '../data/agency.txt' agency;
.import '../data/calendar_dates.txt' calendar_dates;
.import '../data/feed_info.txt' feed_info;
.import '../data/routes.txt' routes;
.import '../data/shapes.txt' shapes;
.import '../data/stop_times.txt' stop_times;
.import '../data/stops.txt' stops;
.import '../data/trips.txt' trips;