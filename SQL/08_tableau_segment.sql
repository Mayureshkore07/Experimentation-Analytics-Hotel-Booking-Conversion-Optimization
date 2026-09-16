SELECT
    u.device,
    ea.variant,

    COUNT(DISTINCT ea.user_id) AS users,

    COUNT(DISTINCT b.user_id) AS bookings,

    ROUND(
        COUNT(DISTINCT b.user_id)::numeric
        *100/
        COUNT(DISTINCT ea.user_id),
        2
    ) AS conversion_rate

FROM users u

JOIN experiment_assignment ea
ON u.user_id = ea.user_id

LEFT JOIN bookings b
ON u.user_id = b.user_id

GROUP BY
    u.device,
    ea.variant;