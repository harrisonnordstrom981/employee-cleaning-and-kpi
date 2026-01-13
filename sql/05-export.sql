-- 05_export.sql
-- Purpose: “final” views you connect Tableau to (clean, stable, analysis-ready)
-- If you only want 1-2 data sources in Tableau, use these.

-- 1) Row-level cleaned steps (for flexible Tableau charts)
CREATE OR REPLACE VIEW `funnel-analysis-483703.funnel_analysis_data.vw_tableau_funnel_steps` AS
SELECT
  user_id,
  device_type,
  step_num,
  step_name,
  step_ts,
  DATE(step_ts) AS step_date,
  revenue,
  traffic_source
FROM `funnel-analysis-483703.funnel_analysis_data.vw_funnel_steps`
WHERE step_num IS NOT NULL;

-- 2) Funnel summary by device (best for funnel charts + KPI cards)
CREATE OR REPLACE VIEW `funnel-analysis-483703.funnel_analysis_data.vw_tableau_funnel_summary` AS
SELECT *
FROM `funnel-analysis-483703.funnel_analysis_data.vw_funnel_summary_device`;
