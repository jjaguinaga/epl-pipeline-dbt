# epl-pipeline-dbt

**dbt transformation layer for the [epl-pipeline](https://github.com/jjaguinaga/epl-pipeline) project.**

This project sits on top of the EPL ETL pipeline and runs dbt models against the PostgreSQL database to create clean, analytics-ready views. It follows the same staging and mart pattern used in my other dbt projects.

---

## How It Connects

```
epl-pipeline (Extract, Transform, Load to PostgreSQL)
        ↓
epl-pipeline-dbt (dbt models, analytics-ready views)
```

---

## Models

### Staging
| Model | Description |
|---|---|
| `stg_epl_matches` | Reads from the raw `matches` table and standardizes column names and types |

### Marts
| Model | Description |
|---|---|
| `home_top_3` | Top 3 home teams by goals scored |
| `away_top_3` | Top 3 away teams by goals scored |

---

## Data Tests

- `home_team` - not null
- `away_team` - not null
- `home_score` - not null
- `away_score` - not null

---

## Tech Stack

| Tool | Purpose |
|---|---|
| dbt Core | Transformation and testing |
| PostgreSQL | Target database |
| SQL | Model logic |
| Git | Version control |

---

## How to Run

1. First run the ETL pipeline: [epl-pipeline](https://github.com/jjaguinaga/epl-pipeline)

2. Install dbt:
```bash
pip install dbt-postgres
```

3. Configure your profile in `~/.dbt/profiles.yml` pointing to your local PostgreSQL `epl_2023` database

4. Run all models:
```bash
dbt run
```

5. Run data quality tests:
```bash
dbt test
```

---

## Data Source

[TheSportsDB Free API](https://www.thesportsdb.com/api.php) - English Premier League 2023-2024 Season

---

## Related Projects

- [epl-pipeline](https://github.com/jjaguinaga/epl-pipeline) - ETL pipeline that loads the raw data
- [covid-dbt](https://github.com/jjaguinaga/covid-dbt) - Same dbt pattern on healthcare data
- [covid-bigquery-dbt](https://github.com/jjaguinaga/covid-bigquery-dbt) - dbt on Google BigQuery
