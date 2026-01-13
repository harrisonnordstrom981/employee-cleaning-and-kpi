-- 02_funnel_view.sql
-- Purpose: Map step names to an ordered step number, so charts sort correctly.
-- Output: vw_funnel_steps (VIEW)

CREATE OR REPLACE VIEW `funnel-analysis-483703.funnel_analysis_data.vw_funnel_steps` AS
WITH base AS (
  SELECT *
  FROM `funnel-analysis-483703.funnel_analysis_data.vw_funnel_clean`
),
step_map AS (
  -- Edit these step names to match EXACTLY what is in your raw data
  SELECT 'Step 1: Visit'     AS step_name, 1 AS step_num UNION ALL
  SELECT 'Step 2: Sign Up'   AS step_name, 2 AS step_num UNION ALL
  SELECT 'Step 3: Activate'  AS step_name, 3 AS step_num UNION ALL
  SELECT 'Step 4: Subscribe' AS step_name, 4 AS step_num UNION ALL
  SELECT 'Step 5: Purchase'  AS step_name, 5 AS step_num
)
SELECT
  b.user_id,
  b.device_type,
  b.step_name,
  sm.step_num,
  b.step_ts,
  b.revenue,
  b.traffic_source
FROM base b
LEFT JOIN step_map sm
  USING (step_name);
