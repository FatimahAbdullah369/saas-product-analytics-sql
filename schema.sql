-- Database Setup: SaaS Product Analytics
-- Platform: Google BigQuery

CREATE OR REPLACE TABLE saas_product_analytics.users AS (
  SELECT 101 AS user_id, DATE('2026-01-10') AS signup_date, 'Premium' AS plan_type, 'United States' AS country UNION ALL
  SELECT 102, DATE('2026-01-12'), 'Free', 'United Kingdom' UNION ALL
  SELECT 103, DATE('2026-01-15'), 'Premium', 'Canada' UNION ALL
  SELECT 104, DATE('2026-01-20'), 'Free', 'Germany' UNION ALL
  SELECT 105, DATE('2026-01-22'), 'Free', 'United States' UNION ALL
  SELECT 106, DATE('2026-02-01'), 'Premium', 'India' UNION ALL
  SELECT 107, DATE('2026-02-05'), 'Free', 'Canada' UNION ALL
  SELECT 108, DATE('2026-02-10'), 'Premium', 'United Kingdom' UNION ALL
  SELECT 109, DATE('2026-02-14'), 'Free', 'Australia' UNION ALL
  SELECT 110, DATE('2026-02-18'), 'Premium', 'United States'
);

CREATE OR REPLACE TABLE saas_product_analytics.user_events AS (
  SELECT 1 AS event_id, 101 AS user_id, TIMESTAMP('2026-01-10 09:30:00') AS event_timestamp, 'login' AS event_type UNION ALL
  SELECT 2, 101, TIMESTAMP('2026-01-10 09:45:00'), 'create_project' UNION ALL
  SELECT 3, 101, TIMESTAMP('2026-01-11 14:20:00'), 'invite_team' UNION ALL
  SELECT 4, 102, TIMESTAMP('2026-01-12 11:00:00'), 'login' UNION ALL
  SELECT 5, 102, TIMESTAMP('2026-01-12 11:15:00'), 'create_project' UNION ALL
  SELECT 6, 103, TIMESTAMP('2026-01-15 16:00:00'), 'login' UNION ALL
  SELECT 7, 103, TIMESTAMP('2026-01-16 10:00:00'), 'upgrade' UNION ALL
  SELECT 8, 104, TIMESTAMP('2026-01-20 08:00:00'), 'login' UNION ALL
  SELECT 9, 105, TIMESTAMP('2026-01-22 19:00:00'), 'login' UNION ALL
  SELECT 10, 101, TIMESTAMP('2026-01-25 13:00:00'), 'login' UNION ALL
  SELECT 11, 106, TIMESTAMP('2026-02-01 09:00:00'), 'login' UNION ALL
  SELECT 12, 106, TIMESTAMP('2026-02-01 09:30:00'), 'invite_team' UNION ALL
  SELECT 13, 107, TIMESTAMP('2026-02-05 14:00:00'), 'login' UNION ALL
  SELECT 14, 108, TIMESTAMP('2026-02-10 10:00:00'), 'login' UNION ALL
  SELECT 15, 108, TIMESTAMP('2026-02-11 11:00:00'), 'create_project' UNION ALL
  SELECT 16, 109, TIMESTAMP('2026-02-14 15:30:00'), 'login' UNION ALL
  SELECT 17, 110, TIMESTAMP('2026-02-18 09:00:00'), 'login' UNION ALL
  SELECT 18, 110, TIMESTAMP('2026-02-19 10:15:00'), 'invite_team' UNION ALL
  SELECT 19, 103, TIMESTAMP('2026-02-20 16:00:00'), 'create_project' UNION ALL
  SELECT 20, 106, TIMESTAMP('2026-02-22 11:00:00'), 'create_project'
);

CREATE OR REPLACE TABLE saas_product_analytics.subscriptions AS (
  SELECT 501 AS subscription_id, 101 AS user_id, 29.99 AS monthly_amount, 'Active' AS status UNION ALL
  SELECT 502, 103, 49.99, 'Active' UNION ALL
  SELECT 503, 106, 29.99, 'Active' UNION ALL
  SELECT 504, 108, 49.99, 'Cancelled' UNION ALL
  SELECT 505, 110, 29.99, 'Active'
);
