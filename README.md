# SaaS Product Analytics Portfolio Project

## Project Overview
This repository contains a data analysis case study focusing on product metrics, user behavior tracking, and subscription analytics for a mock B2B SaaS productivity platform. The objective is to demonstrate intermediate-level SQL proficiency by translating typical tech business questions into optimized relational database queries.

## Tech Stack & Data Environment
* **Platform:** Google BigQuery
* **Data Architecture:** 3 Relational Tables (`users`, `user_events`, `subscriptions`) containing mock behavioral interactions, demographic tracking, and financial subscription parameters.

---

## Business Analysis Case Studies

### 1. Core Feature Adoption (Aggregation & Sorting)
**Business Question:** *Which features in our application are utilized the most by our active users?*

```sql
SELECT 
    event_type,
    COUNT(event_id) AS total_actions
FROM saas_product_analytics.user_events
GROUP BY event_type
ORDER BY total_actions DESC;
```

**Results:**

| event_type | total_actions |
| :--- | :--- |
| login | 10 |
| create_project | 5 |
| invite_team | 4 |
| upgrade | 1 |

* **Data Analyst Insight:** `create_project` is confirmed as the platform's core high-intent feature. Feature visibility optimizations should prioritize reducing friction around this action.

---

### 2. Tiered Engagement Disparity (Inner Joins & Distinct Counting)
**Business Question:** *Are premium tier users demonstrating higher active engagement levels than free tier users?*

```sql
SELECT 
    u.plan_type,
    COUNT(e.event_id) AS total_events,
    COUNT(DISTINCT u.user_id) AS unique_users,
    ROUND(COUNT(e.event_id) / COUNT(DISTINCT u.user_id), 1) AS avg_events_per_user
FROM saas_product_analytics.users AS u
INNER JOIN saas_product_analytics.user_events AS e 
    ON u.user_id = e.user_id
GROUP BY u.plan_type
ORDER BY avg_events_per_user DESC;
```

**Results:**

| plan_type | total_events | unique_users | avg_events_per_user |
| :--- | :--- | :--- | :--- |
| Premium | 11 | 5 | 2.2 |
| Free | 9 | 5 | 1.8 |

* **Data Analyst Insight:** Premium tier users display a 22% higher average interaction depth (2.2 actions/user) than free tier counterparts, verifying that monetized structures align with higher system reliance.

---

### 3. Collaboration Onboarding Health (Common Table Expressions - CTEs)
**Business Question:** *What specific percentage of our total registered user base has successfully adopted the 'invite_team' collaborative feature?*

```sql
WITH total_users_count AS (
    SELECT COUNT(DISTINCT user_id) AS grand_total 
    FROM saas_product_analytics.users
),
collaborative_users AS (
    SELECT COUNT(DISTINCT user_id) AS active_collaborators 
    FROM saas_product_analytics.user_events 
    WHERE event_type = 'invite_team'
)
SELECT 
    c.active_collaborators,
    t.grand_total,
    ROUND((c.active_collaborators / t.grand_total) * 100, 2) AS adoption_rate_percentage
FROM collaborative_users AS c, total_users_count AS t;
```

**Results:**

| active_collaborators | grand_total | adoption_rate_percentage |
| :--- | :--- | :--- |
| 3 | 10 | 30.00 |

* **Data Analyst Insight:** The collaboration feature exhibits a critically low adoption rate of only 30.00%. Because collaboration loops are key variables for customer retention, the product team should explore in-app product tours targeting the remaining 70% of isolated users.

---

## Technical Skills Demonstrated
* **Relational Database Design:** Table relationships utilizing primary/foreign key connections.
* **Advanced Aggregations:** Filtering distinct customer paths via `COUNT(DISTINCT)`.
* **Subquery Structuring:** Isolating decoupled calculations using memory-efficient **Common Table Expressions (CTEs)**.
* **Business Translation:** Translating technical logs into actionable stakeholders insights.
