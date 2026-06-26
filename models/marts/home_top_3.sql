{{ config(materialized='view') }}

SELECT home_team, home_score
from {{ ref('stg_epl_matches') }}
ORDER BY 2 DESC
LIMIT 3
