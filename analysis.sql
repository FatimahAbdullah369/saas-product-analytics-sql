-- =========================================================
-- CASE STUDY QUERIES: SAAS PRODUCT ENGAGEMENT
-- =========================================================

-- Q1: Which features in our app are used the most?
SELECT 
    event_type,
    COUNT(event_id) AS total_actions
FROM saas_product_analytics.user_events
GROUP BY event_type
ORDER BY total_actions DESC;


-- Q2: Are premium users more active than free users?
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


-- Q3: What percentage of our total user base has used 'invite_team'?
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
