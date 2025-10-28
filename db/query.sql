SELECT route_id, route_short_name, route_long_name FROM routes
WHERE DISTINCT route_id IN (
    SELECT route_id FROM trips
    WHERE trip_id IN (
        SELECT trip_id FROM stop_times
        WHERE stop_id = '10'
    )
)