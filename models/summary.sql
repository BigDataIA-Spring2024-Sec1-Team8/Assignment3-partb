{{
  config(materialized='table')
}}
WITH summary_data AS (
  SELECT
    name_of_the_topic AS Topic,
    Level,
    year,
    COUNT(*) AS Number_of_articles,
    COALESCE(MIN(LENGTH(Summary)), 0) AS Min_Length_Summary,
    COALESCE(MAX(LENGTH(Summary)),0) AS Max_Length_Summary,
    COALESCE(MIN(LENGTH(Learning_Outcomes)), 0) AS Min_Length_Learning_Outcomes,
    COALESCE(MAX(LENGTH(Learning_Outcomes)),0) AS Max_Length_Learning_Outcomes
  FROM url_data
  GROUP BY Topic, Level,year
)

SELECT
  Topic,
  Level,
  year,
  Number_of_articles,
  Min_Length_Summary,
  Max_Length_Summary,
  Min_Length_Learning_Outcomes,
  Max_Length_Learning_Outcomes
FROM summary_data