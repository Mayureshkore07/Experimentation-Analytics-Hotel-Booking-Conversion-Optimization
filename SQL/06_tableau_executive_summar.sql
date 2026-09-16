SELECT
    ea.variant,
    COUNT(DISTINCT ea.user_id) AS users,
    COUNT(DISTINCT b.user_id) AS bookings,
    ROUND(
        COUNT(DISTINCT b.user_id)::numeric
        *100/
        COUNT(DISTINCT ea.user_id),
        2
    ) AS conversion_rate,
    ROUND(
        SUM(COALESCE(b.booking_value,0)),
        2
    ) AS total_revenue,
    ROUND(
        SUM(COALESCE(b.booking_value,0))
        /
        COUNT(DISTINCT ea.user_id),
        2
    ) AS revenue_per_user
FROM experiment_assignment ea
LEFT JOIN bookings b
ON ea.user_id = b.user_id
GROUP BY ea.variant
ORDER BY ea.variant;