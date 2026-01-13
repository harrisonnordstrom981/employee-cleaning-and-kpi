-- 01_cleaning_view.sql
-- Purpose: Standardize fields, enforce types, remove obvious junk rows.
-- Output: vw_funnel_clean (VIEW)

CREATE OR REPLACE VIEW `funnel-analysis-483703.funnel_analysis_data.vw_funnel_clean` AS
SELECT
  -- Core IDs
  CAST(user_id AS STRING) AS user_id,

  -- Normalize device labels (makes Tableau cleaner)
  CASE
    WHEN LOWER(TRIM(device_type)) IN ('mobile', 'phone', 'ios', 'android') THEN 'Mobile'
    WHEN LOWER(TRIM(device_type)) IN ('desktop', 'web', 'laptop') THEN 'Desktop'
    ELSE 'Other'
  END AS device_type,

  -- Funnel step label
  CAST(step_name AS STRING) AS step_name,

  -- Timestamp standardization
  -- If step_timestamp is already TIMESTAMP, this is safe; if it's string, it will error.
  -- If yours is string, replace with SAFE.PARSE_TIMESTAMP(format, step_timestamp).
  CAST(step_timestamp AS TIMESTAMP) AS step_ts,

  -- Revenue (keep numeric)
  -- SAFE_CAST prevents query failure if bad strings exist.
  SAFE_CAST(revenue AS FLOAT64) AS revenue,

  -- Optional: campaign/source if present
  CAST(traffic_source AS STRING) AS traffic_source

FROM `funnel-analysis-483703.funnel_analysis_data.raw_funnel_users`
WHERE user_id IS NOT NULL
  AND step_name IS NOT NULL;
