-- 03_device_summary.sql
-- Purpose: Create a Tableau-ready funnel summary:
-- - Users at each step
-- - Conversion rate vs prior step (step-to-step)
-- - Conversion rate vs Step 1 (overall)
-- Output: vw_funnel_summary_device (VIEW)

CREATE OR REPLACE VIEW `funnel-analysis-483703.funnel_analysis_data.vw_funnel_summary_device` AS
WITH step_users AS (
  SELECT
    device_type,
    step_num,
    step_name,
    COUNT(DISTINCT user_id) AS users
  FROM `funnel-analysis-483703.funnel_analysis_data.vw_funnel_steps`
  WHERE step_num IS NOT NULL
  GROUP BY device_type, step_num, step_name
),
with_prev AS (
  SELECT
    device_type,
    step_num,
    step_name,
    users,
    LAG(users) OVER (PARTITION BY device_type ORDER BY step_num) AS prev_step_users,
    FIRST_VALUE(users) OVER (PARTITION BY device_type ORDER BY step_num) AS step1_users
  FROM step_users
)
SELECT
  device_type,
  step_num,
  step_name,
  users,

  -- Step-to-step conversion rate
  SAFE_DIVIDE(users, prev_step_users) AS conv_vs_prev_step,

  -- Overall conversion rate vs Step 1
  SAFE_DIVIDE(users, step1_users) AS conv_vs_step1

FROM with_prev
ORDER BY device_type, step_num;
