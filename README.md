# Experimentation-Analytics-Hotel-Booking-Conversion-Optimization
End-to-End Experimentation Analytics for Hotel Booking Conversion Optimization using Python, PostgreSQL, SQL and Tableau
# Experimentation Analytics for Hotel Booking Conversion Optimization

## Project Overview

This project simulates an A/B testing experiment conducted on a hotel booking platform to evaluate whether a new booking experience (Variant B) improves user conversion and revenue compared to the existing experience (Variant A).

The project covers the complete analytics workflow:

- Synthetic dataset generation using Python
- Data storage and analysis in PostgreSQL
- Funnel and KPI analysis using SQL
- Statistical significance testing
- Interactive dashboards in Tableau
- Business recommendations based on experiment results

---

## Business Problem

A hotel booking platform wants to determine whether a redesigned booking experience improves user behavior and business performance.

The experiment compares:

- Variant A (Control)
- Variant B (Treatment)

Key success metrics:

- Conversion Rate
- Booking Volume
- Revenue
- Revenue Per User
- Funnel Performance

---

## Tech Stack

- Python
- PostgreSQL
- SQL
- Tableau
- Pandas
- NumPy
- SciPy

---

## Dataset Summary

| Dataset | Records |
|----------|---------:|
| Users | 100,000 |
| Experiment Assignments | 100,000 |
| User Events | 156,858 |
| Bookings | 5,699 |

---

## Executive Results

### Conversion Rate

| Variant | Conversion Rate |
|----------|---------:|
| A | 4.39% |
| B | 7.00% |

### Revenue

| Variant | Revenue |
|----------|---------:|
| A | ₹18,838,242 |
| B | ₹30,299,389 |

### Revenue Per User

| Variant | Revenue Per User |
|----------|---------:|
| A | ₹377.05 |
| B | ₹605.53 |

---

## Funnel Analysis

| Stage | Variant A | Variant B |
|---------|---------:|---------:|
| Click Rate | 31.81% | 36.92% |
| Checkout Rate | 44.75% | 52.40% |
| Booking Rate | 30.84% | 36.21% |

---

## Statistical Testing

Result:

- Statistically Significant
- Null Hypothesis Rejected
- Variant B Performs Better

---

## Business Insights

- Conversion Rate increased by 59.45%
- Revenue increased by 60.84%
- Revenue Per User increased by 60.59%
- Largest improvement occurred during Checkout Stage
- Variant B outperformed Variant A across all funnel stages

---

## Recommendation

Deploy Variant B as the new booking experience due to higher conversion rates, increased revenue, improved funnel performance, and statistically significant results.

---

## Dashboard Preview

### Executive Summary Dashboard

(Add Screenshot Here)

### Funnel Analysis Dashboard

(Add Screenshot Here)

---

## Author

Mayuresh Kore

B.Tech Computer Science Engineering

Aspiring Data Analyst | Product Analyst
