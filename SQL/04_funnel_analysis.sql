-- Funnel Counts by Variant

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

-- Funnel Conversion Rates

WITH funnel AS
(
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
)

SELECT
    variant,

    page_views,

    hotel_clicks,

    ROUND(hotel_clicks::numeric *100/page_views,2)
    AS click_rate,

    checkout_starts,

    ROUND(checkout_starts::numeric *100/hotel_clicks,2)
    AS checkout_rate,

    bookings,

    ROUND(bookings::numeric *100/checkout_starts,2)
    AS booking_rate

FROM funnel;

-- Daily Funnel Trend

SELECT
    event_date,
    event,
    COUNT(*) AS total_events
FROM user_events
GROUP BY event_date,event
ORDER BY event_date;

-- Daily Bookings by Variant

SELECT
    ue.event_date,
    ea.variant,
    COUNT(*) AS bookings
FROM user_events ue

JOIN experiment_assignment ea
ON ue.user_id = ea.user_id

WHERE ue.event='booking'

GROUP BY
    ue.event_date,
    ea.variant

ORDER BY
    ue.event_date;

/*
Business Insight:

Variant B improved performance across every stage of the booking funnel.

Click Rate:
31.81% → 36.92%

Checkout Rate:
44.75% → 52.40%

Booking Completion Rate:
30.84% → 36.21%

The strongest improvement occurred during the checkout stage, suggesting
that the redesigned booking page reduced friction and encouraged more users
to proceed with the booking process.
*/