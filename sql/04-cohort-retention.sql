-- 04_cohort_retention.sql
-- Purpose: Simple cohorting by first seen date (or first step timestamp)
-- Output: vw_user_cohorts (VIEW) and vw_cohort_funnel (VIEW)

CREATE OR REPLACE VIEW `funnel-analysis-483703.funnel_analysis_data.vw_user_cohorts` AS
WITH first_seen AS (
  SELECT
    user_id,
    device_type,
    DATE(MIN(step_ts)) AS cohort_date
  FROM `funnel-analysis-483703.funnel_analysis_data.vw_funnel_steps`
  GROUP BY user_id, device_type
)
SELECT * FROM first_seen;

-- Cohort funnel progression counts
CREATE OR REPLACE VIEW `funnel-analysis-483703.funnel_analysis_data.vw_cohort_funnel` AS
SELECT
  c.cohort_date,
  s.device_type,
  s.step_num,
  s.step_name,
  COUNT(DISTINCT s.user_id) AS users
FROM `funnel-analysis-483703.funnel_analysis_data.vw_funnel_steps` s
JOIN `funnel-analysis-483703.funnel_analysis_data.vw_user_cohorts` c
  ON s.user_id = c.user_id
 AND s.device_type = c.device_type
WHERE s.step_num IS NOT NULL
GROUP BY c.cohort_date, s.device_type, s.step_num, s.step_name
ORDER BY cohort_date, device_type, step_num;
