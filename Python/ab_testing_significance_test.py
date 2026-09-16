from statsmodels.stats.proportion import proportions_ztest

# Variant A
bookings_A = 2194
users_A = 49962

# Variant B
bookings_B = 3505
users_B = 50038

# Success counts
successes = [bookings_A, bookings_B]

# Total observations
samples = [users_A, users_B]

# Z-Test
z_stat, p_value = proportions_ztest(
    successes,
    samples
)

print("A/B TEST RESULTS")
print("-" * 30)

print(f"Z Statistic : {z_stat:.4f}")
print(f"P Value     : {p_value:.10f}")

print("\nInterpretation")

if p_value < 0.05:
    print(
        "Result is statistically significant."
    )
    print(
        "Reject Null Hypothesis."
    )
    print(
        "Variant B performs significantly better."
    )
else:
    print(
        "Result is NOT statistically significant."
    )
    print(
        "Fail to Reject Null Hypothesis."
    )