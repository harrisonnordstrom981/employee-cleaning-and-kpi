-- 00_sanity.sql
-- Purpose: Quick checks to understand raw data shape, duplicates, and missingness.

SELECT
  COUNT(*) AS row_count,
  COUNT(DISTINCT user_id) AS distinct_users
FROM `funnel-analysis-483703.funnel_analysis_data.raw_funnel_users`;

-- Device distribution
SELECT
  device_type,
  COUNT(*) AS rows,
  COUNT(DISTINCT user_id) AS users
FROM `funnel-analysis-483703.funnel_analysis_data.raw_funnel_users`
GROUP BY device_type
ORDER BY users DESC;

-- Check for duplicate user-step records (should usually be 0)
SELECT
  user_id,
  step_name,
  COUNT(*) AS step_rows
FROM `funnel-analysis-483703.funnel_analysis_data.raw_funnel_users`
GROUP BY user_id, step_name
HAVING COUNT(*) > 1
ORDER BY step_rows DESC;

-- Missing timestamps check (adjust column names if yours differ)
SELECT
  SUM(CASE WHEN step_timestamp IS NULL THEN 1 ELSE 0 END) AS missing_step_timestamp
FROM `funnel-analysis-483703.funnel_analysis_data.raw_funnel_users`;
