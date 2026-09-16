# Experimentation-Analytics-Hotel-Booking-Conversion-Optimization
End-to-End Experimentation Analytics for Hotel Booking Conversion Optimization using Python, PostgreSQL, SQL and Tableau
# A/B Testing Analytics for Hotel Booking Conversion Optimization

## Project Overview

This project simulates a real-world A/B testing experiment conducted on a hotel booking platform to evaluate whether a redesigned booking experience (Variant B) improves conversion rates, booking volume, revenue, and overall funnel performance compared to the existing experience (Variant A).

The analysis follows a complete experimentation workflow commonly used by Product Analysts, Growth Analysts, and Data Analysts:

- Experiment Design
- SQL-Based KPI Analysis
- Funnel Analysis
- Statistical Significance Testing
- Business Recommendations
- Tableau Dashboard Reporting

---

## Business Problem

A hotel booking platform launched a new booking experience (Variant B) and wanted to determine whether it improved user behavior and business performance.

The experiment compared:

- Variant A (Control)
- Variant B (Treatment)

Success was measured using:

- Conversion Rate
- Booking Volume
- Revenue
- Revenue Per User
- Funnel Conversion Metrics

---

## Dataset

The project consists of four datasets:

### users.csv
Contains user information and experiment assignments.

### experiment_assignment.csv
Maps users to Variant A or Variant B.

### user_events.csv
Tracks user actions across the booking journey.

### bookings.csv
Contains completed hotel bookings and revenue generated.

---

## Tools & Technologies

- PostgreSQL
- SQL
- Python
- Tableau
- Excel
- GitHub

---

## SQL Analysis

Using PostgreSQL, the experiment data was analyzed to measure business performance across both variants.

### Key Questions Answered

1. Which variant achieved a higher conversion rate?
2. Which variant generated more bookings?
3. Which variant generated more revenue?
4. Which variant generated higher revenue per user?
5. At which funnel stage did users drop off?
6. Did the treatment improve funnel conversion rates?

---

## Experiment Results

### Conversion Rate Analysis

| Variant | Users | Bookings | Conversion Rate |
|----------|---------:|---------:|---------:|
| A | 49,962 | 2,194 | 4.39% |
| B | 50,038 | 3,505 | 7.00% |

### Revenue Analysis

| Variant | Total Revenue |
|----------|-------------:|
| A | ₹18,838,242 |
| B | ₹30,299,389 |

### Revenue Per User

| Variant | Revenue Per User |
|----------|----------------:|
| A | ₹377.05 |
| B | ₹605.53 |

---

## Funnel Analysis

### Funnel Stage Counts

| Stage | Variant A | Variant B |
|---------|---------:|---------:|
| Page Views | 49,962 | 50,038 |
| Hotel Clicks | 15,895 | 18,472 |
| Checkout Starts | 7,113 | 9,679 |
| Bookings | 2,194 | 3,505 |

### Funnel Conversion Rates

| Stage | Variant A | Variant B |
|---------|---------:|---------:|
| Click Rate | 31.81% | 36.92% |
| Checkout Rate | 44.75% | 52.40% |
| Booking Rate | 30.84% | 36.21% |

### Key Insight

Variant B outperformed Variant A across every stage of the booking funnel.

The largest improvement occurred during the checkout stage, indicating reduced friction in the booking experience and improved completion rates.

---

## Statistical Significance Testing

A two-proportion statistical significance test was conducted using Python to validate the experiment results.

### Hypotheses

**Null Hypothesis (H₀):**
There is no difference between Variant A and Variant B conversion rates.

**Alternative Hypothesis (H₁):**
Variant B performs differently from Variant A.

### Test Result

- Result is statistically significant.
- Null Hypothesis Rejected.
- Variant B performs significantly better than Variant A.
- p-value < 0.05

This indicates that the observed improvement is unlikely to be due to random chance.

---

## Business Impact

### Conversion Uplift

4.39% → 7.00%

**+59.45% Improvement**

### Revenue Uplift

₹18,838,242 → ₹30,299,389

**+60.84% Improvement**

### Revenue Per User Uplift

₹377.05 → ₹605.53

**+60.59% Improvement**

---

## Recommendation

Based on SQL analysis, funnel performance, revenue impact, and statistical significance testing, Variant B should be deployed as the new booking experience.

Variant B generated:

- Higher conversion rates
- More bookings
- Higher revenue
- Better funnel performance
- Statistically significant improvements

---

## Tableau Dashboards

### Executive Summary Dashboard

- Conversion Rate Comparison
- Revenue Comparison
- Revenue Per User Comparison
- Statistical Significance Summary
- Business Recommendation

### Booking Funnel Dashboard

- Funnel Stage Counts
- Funnel Conversion Rate Comparison
- Funnel Performance Insights
- Variant-Level Analysis

---

## Skills Demonstrated

### SQL
- KPI Analysis
- Funnel Analysis
- Aggregations
- Business Metrics
- Experiment Analytics

### A/B Testing
- Experiment Design
- Conversion Analysis
- Hypothesis Testing
- Statistical Significance Validation

### Tableau
- Executive Dashboard Design
- Funnel Visualization
- Business Reporting

### Analytics
- Product Analytics
- Growth Analytics
- Revenue Analysis
- Conversion Optimization
- Data-Driven Decision Making

---

## Author

**Mayuresh Kore**

B.Tech Computer Science Engineering

Aspiring Data Analyst | Product Analyst | Marketing Analyst

Skills: SQL, Python, Tableau, Power BI, Excel, A/B Testing, Data Analytics
