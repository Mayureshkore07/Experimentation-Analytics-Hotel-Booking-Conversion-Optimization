import pandas as pd

print("Users:", pd.read_csv("users.csv").shape)
print("Assignments:", pd.read_csv("experiment_assignment.csv").shape)
print("Events:", pd.read_csv("user_events.csv").shape)
print("Bookings:", pd.read_csv("bookings.csv").shape)