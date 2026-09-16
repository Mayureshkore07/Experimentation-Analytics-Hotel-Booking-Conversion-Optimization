-- Row Count Validation

SELECT COUNT(*) AS total_users
FROM users;

SELECT COUNT(*) AS total_assignments
FROM experiment_assignment;

SELECT COUNT(*) AS total_events
FROM user_events;

SELECT COUNT(*) AS total_bookings
FROM bookings;

-- Null Checks

SELECT COUNT(*) AS null_country
FROM users
WHERE country IS NULL;

SELECT COUNT(*) AS null_device
FROM users
WHERE device IS NULL;

SELECT COUNT(*) AS null_source
FROM users
WHERE traffic_source IS NULL;

SELECT COUNT(*) AS null_variant
FROM experiment_assignment
WHERE variant IS NULL;

SELECT COUNT(*) AS null_event
FROM user_events
WHERE event IS NULL;

SELECT COUNT(*) AS null_booking_value
FROM bookings
WHERE booking_value IS NULL;

-- Duplicate User Check

SELECT user_id,
       COUNT(*)
FROM users
GROUP BY user_id
HAVING COUNT(*) > 1;

-- Variant Distribution

SELECT
    variant,
    COUNT(*) AS users
FROM experiment_assignment
GROUP BY variant;

-- Country Distribution
SELECT
    country,
    COUNT(*) AS users
FROM users
GROUP BY country
ORDER BY users DESC;

-- Device Distribution

SELECT
    device,
    COUNT(*) AS users
FROM users
GROUP BY device
ORDER BY users DESC;

-- Trafic Source Distributionn

SELECT
    traffic_source,
    COUNT(*) AS users
FROM users
GROUP BY traffic_source
ORDER BY users DESC;

-- Event Distribution

SELECT
    event,
    COUNT(*) AS total_events
FROM user_events
GROUP BY event
ORDER BY total_events DESC;