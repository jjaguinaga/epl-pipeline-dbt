{{ config(materialized='view') }}

with source as (
   SELECT game,
   home_team,
   away_team,
   home_score,
   away_score
   FROM matches
)
SELECT * FROM source
