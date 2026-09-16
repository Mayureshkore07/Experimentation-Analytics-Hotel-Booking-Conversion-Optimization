import pandas as pd
import numpy as np
from datetime import datetime, timedelta

np.random.seed(42)

# =====================================================
# CONFIGURATION
# =====================================================

NUM_USERS = 100000

START_DATE = datetime(2026, 8, 1)
EXPERIMENT_DAYS = 30

# =====================================================
# USERS TABLE
# =====================================================

countries = [
    "India",
    "Singapore",
    "Thailand",
    "Malaysia",
    "Indonesia"
]

devices = [
    "Mobile",
    "Desktop",
    "Tablet"
]

traffic_sources = [
    "Google Ads",
    "Facebook Ads",
    "Instagram",
    "Organic",
    "Email"
]

signup_dates = [
    START_DATE + timedelta(days=np.random.randint(0, EXPERIMENT_DAYS))
    for _ in range(NUM_USERS)
]

users = pd.DataFrame({
    "user_id": range(1, NUM_USERS + 1),
    "country": np.random.choice(countries, NUM_USERS),
    "device": np.random.choice(
        devices,
        NUM_USERS,
        p=[0.65, 0.25, 0.10]
    ),
    "traffic_source": np.random.choice(
        traffic_sources,
        NUM_USERS
    ),
    "signup_date": signup_dates
})

# =====================================================
# EXPERIMENT ASSIGNMENT
# =====================================================

experiment_assignment = pd.DataFrame({
    "user_id": users["user_id"],
    "variant": np.random.choice(
        ["A", "B"],
        NUM_USERS
    ),
    "assigned_date": users["signup_date"]
})

# =====================================================
# EVENT GENERATION
# =====================================================

events = []
bookings = []

booking_id = 1

for _, row in experiment_assignment.iterrows():

    user_id = row["user_id"]
    variant = row["variant"]

    base_date = row["assigned_date"]

    # PAGE VIEW
    page_view_date = base_date

    events.append([
        user_id,
        page_view_date.date(),
        "page_view"
    ])

    # Variant B performs better
    click_prob = 0.32 if variant == "A" else 0.37

    if np.random.rand() < click_prob:

        click_date = page_view_date + timedelta(
            days=np.random.randint(0, 2)
        )

        events.append([
            user_id,
            click_date.date(),
            "hotel_click"
        ])

        checkout_prob = (
            0.45 if variant == "A"
            else 0.52
        )

        if np.random.rand() < checkout_prob:

            checkout_date = click_date + timedelta(
                days=np.random.randint(0, 2)
            )

            events.append([
                user_id,
                checkout_date.date(),
                "checkout_start"
            ])

            booking_prob = (
                0.30 if variant == "A"
                else 0.36
            )

            if np.random.rand() < booking_prob:

                booking_date = checkout_date + timedelta(
                    days=np.random.randint(0, 3)
                )

                events.append([
                    user_id,
                    booking_date.date(),
                    "booking"
                ])

                bookings.append([
                    booking_id,
                    user_id,
                    booking_date.date(),
                    np.random.randint(2000, 15000),
                    np.random.choice(
                        [
                            "Budget",
                            "Standard",
                            "Premium",
                            "Luxury"
                        ],
                        p=[0.35, 0.40, 0.20, 0.05]
                    )
                ])

                booking_id += 1

# =====================================================
# DATAFRAMES
# =====================================================

user_events = pd.DataFrame(
    events,
    columns=[
        "user_id",
        "event_date",
        "event"
    ]
)

bookings_df = pd.DataFrame(
    bookings,
    columns=[
        "booking_id",
        "user_id",
        "booking_date",
        "booking_value",
        "hotel_category"
    ]
)

# =====================================================
# EXPORT
# =====================================================

users.to_csv(
    "users.csv",
    index=False
)

experiment_assignment.to_csv(
    "experiment_assignment.csv",
    index=False
)

user_events.to_csv(
    "user_events.csv",
    index=False
)

bookings_df.to_csv(
    "bookings.csv",
    index=False
)

# =====================================================
# SUMMARY
# =====================================================

print("\nDATASET GENERATED SUCCESSFULLY\n")

print(f"Users: {len(users):,}")
print(f"Assignments: {len(experiment_assignment):,}")
print(f"Events: {len(user_events):,}")
print(f"Bookings: {len(bookings_df):,}")