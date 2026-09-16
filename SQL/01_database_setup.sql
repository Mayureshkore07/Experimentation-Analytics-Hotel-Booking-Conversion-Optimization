CREATE TABLE users (
    user_id INT PRIMARY KEY,
    country VARCHAR(50),
    device VARCHAR(50),
    traffic_source VARCHAR(50),
    signup_date DATE
);

CREATE TABLE experiment_assignment (
    user_id INT,
    variant CHAR(1),
    assigned_date DATE
);

CREATE TABLE user_events (
    user_id INT,
    event_date DATE,
    event VARCHAR(50)
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    user_id INT,
    booking_date DATE,
    booking_value NUMERIC,
    hotel_category VARCHAR(50)
);

SELECT COUNT(*) AS total_users
FROM users;

SELECT COUNT(*) AS total_assignments
FROM experiment_assignment;

SELECT COUNT(*) AS total_events
FROM user_events;

SELECT COUNT(*) AS total_bookings
FROM bookings;