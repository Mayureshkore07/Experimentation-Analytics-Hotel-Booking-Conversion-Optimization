-- Question 1: How Many Users Were Assigned to Each Variant?

SELECT
    variant,
    COUNT(*) AS total_users
FROM experiment_assignment
GROUP BY variant;

-- Question 2: How Many Bookings Came From Each Variant?

SELECT
    ea.variant,
    COUNT(*) AS total_bookings
FROM bookings b
JOIN experiment_assignment ea
    ON b.user_id = ea.user_id
GROUP BY ea.variant;

-- Question 3: Conversion Rate by Variant

SELECT
    ea.variant,
    COUNT(DISTINCT b.user_id) AS bookings,
    COUNT(DISTINCT ea.user_id) AS users,
    ROUND(
        COUNT(DISTINCT b.user_id)::numeric
        * 100 /
        COUNT(DISTINCT ea.user_id),
        2
    ) AS conversion_rate
FROM experiment_assignment ea
LEFT JOIN bookings b
    ON ea.user_id = b.user_id
GROUP BY ea.variant;

-- Question 4: Total Revenue by Variant

SELECT
    ea.variant,
    ROUND(
        SUM(b.booking_value),
        2
    ) AS total_revenue
FROM bookings b
JOIN experiment_assignment ea
    ON b.user_id = ea.user_id
GROUP BY ea.variant;

-- Question 5: Average Booking Value

SELECT
    ea.variant,
    ROUND(
        AVG(b.booking_value),
        2
    ) AS avg_booking_value
FROM bookings b
JOIN experiment_assignment ea
    ON b.user_id = ea.user_id
GROUP BY ea.variant;

-- Question 6: Revenue Per User (RPU)

SELECT
    ea.variant,
    ROUND(
        SUM(COALESCE(b.booking_value,0))
        /
        COUNT(DISTINCT ea.user_id),
        2
    ) AS revenue_per_user
FROM experiment_assignment ea
LEFT JOIN bookings b
    ON ea.user_id = b.user_id
GROUP BY ea.variant;

-- Conversion Rate Uplift %

WITH conversion_metrics AS
(
    SELECT
        ea.variant,
        COUNT(DISTINCT b.user_id) AS bookings,
        COUNT(DISTINCT ea.user_id) AS users,
        COUNT(DISTINCT b.user_id)::numeric
        /
        COUNT(DISTINCT ea.user_id) * 100 AS conversion_rate
    FROM experiment_assignment ea
    LEFT JOIN bookings b
        ON ea.user_id = b.user_id
    GROUP BY ea.variant
)

SELECT
ROUND(
(
MAX(CASE WHEN variant='B' THEN conversion_rate END)
-
MAX(CASE WHEN variant='A' THEN conversion_rate END)
)
/
MAX(CASE WHEN variant='A' THEN conversion_rate END)
*100,
2
) AS conversion_uplift_pct
FROM conversion_metrics;

-- Revenue Uplift%

WITH revenue_metrics AS
(
    SELECT
        ea.variant,
        SUM(b.booking_value) AS revenue
    FROM bookings b
    JOIN experiment_assignment ea
        ON b.user_id = ea.user_id
    GROUP BY ea.variant
)

SELECT
ROUND(
(
MAX(CASE WHEN variant='B' THEN revenue END)
-
MAX(CASE WHEN variant='A' THEN revenue END)
)
/
MAX(CASE WHEN variant='A' THEN revenue END)
*100,
2
) AS revenue_uplift_pct
FROM revenue_metrics;