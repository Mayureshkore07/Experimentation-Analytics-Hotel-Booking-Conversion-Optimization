SELECT
    ea.variant,

    COUNT(CASE WHEN ue.event='page_view' THEN 1 END) AS page_views,

    COUNT(CASE WHEN ue.event='hotel_click' THEN 1 END) AS hotel_clicks,

    COUNT(CASE WHEN ue.event='checkout_start' THEN 1 END) AS checkout_starts,

    COUNT(CASE WHEN ue.event='booking' THEN 1 END) AS bookings

FROM experiment_assignment ea
LEFT JOIN user_events ue
ON ea.user_id = ue.user_id

GROUP BY ea.variant
ORDER BY ea.variant;