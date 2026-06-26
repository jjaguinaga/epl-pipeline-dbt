{{ config(materialized='view') }}

SELECT away_team, away_score
FROM {{ ref('stg_epl_matches')}}
ORDER BY 2 DESC
LIMIT 3
