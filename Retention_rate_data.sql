-----Retention rate weekly----
WITH cohort AS (
  SELECT
    id AS user_id,
    DATE_TRUNC(DATE(created_at), WEEK(MONDAY)) AS cohort_week
  FROM `bigquery-public-data.thelook_ecommerce.users`
),

activity AS (
  SELECT
    o.user_id,
    DATE_TRUNC(DATE(o.created_at), WEEK(MONDAY)) AS order_week,
    u.created_at AS signup_date,
    DATE_DIFF(
      DATE_TRUNC(DATE(o.created_at), WEEK(MONDAY)),
      DATE_TRUNC(DATE(u.created_at), WEEK(MONDAY)),
      WEEK
    ) AS week_number
  FROM `bigquery-public-data.thelook_ecommerce.orders` o
  JOIN `bigquery-public-data.thelook_ecommerce.users` u
    ON o.user_id = u.id
),

retention AS (
  SELECT
    DATE_TRUNC(DATE(u.created_at), WEEK(MONDAY)) AS cohort_week,
    a.week_number,
    COUNT(DISTINCT a.user_id) AS retained_users
  FROM activity a
  JOIN `bigquery-public-data.thelook_ecommerce.users` u
    ON a.user_id = u.id
  GROUP BY cohort_week, week_number
),

cohort_size AS (
  SELECT
    DATE_TRUNC(DATE(created_at), WEEK(MONDAY)) AS cohort_week,
    COUNT(DISTINCT id) AS total_users
  FROM `bigquery-public-data.thelook_ecommerce.users`
  GROUP BY cohort_week
)

SELECT
  r.cohort_week,
  r.week_number,
  r.retained_users,
  c.total_users,
  ROUND(100 * r.retained_users / c.total_users, 2) AS retention_rate
FROM retention r
JOIN cohort_size c ON r.cohort_week = c.cohort_week
ORDER BY r.cohort_week, r.week_number;
