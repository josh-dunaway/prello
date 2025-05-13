# 🏠 Prello – Scoring System for Second Home Investment in France

This project helps **Prello**, a proptech startup, strategically expand its second-home offerings by identifying the most attractive municipalities across France. Using public datasets, we’ve built a data pipeline and scoring framework to rank towns based on investment potential — factoring in tourism, real estate stress, and local economic indicators.

> ⚙️ Built with **BigQuery**, **DBT**, **GitHub**, and **Looker Studio** using Agile methodology

---

## 📍 Problem Statement

Prello can’t deploy property hunters across all of France. They need:
- A **data-driven scoring system** to rank towns from most to least attractive
- **Dashboards** for buyers and renters to interact with property and market data
- A **predictive model** to estimate rental potential and popularity of new listings

---

## 🎯 Project Goals

### ✅ Iteration 1: City Scoring System
> *Create a reproducible scoring model to rank towns based on second-home investment attractiveness.*

### 🧭 Upcoming Deliverables:
- 🗺️ **Buyer dashboard** – Search by municipality code & filters
- 💶 **Renter dashboard** – Estimate income & hotness based on property characteristics
- 🤖 **ML model** – Predict popularity and rent potential for hypothetical properties

---

## 🧩 Data Sources

All data comes from open French public datasets and is staged via `dbt`. Key tables include:

| Table | Purpose |
|-------|---------|
| `average_salary_by_municipality` | Local profitability signal |
| `real_estate_info_by_municipality` | Housing tension, rental prices |
| `POI_touristic_sites_by_municipality` | Attraction count & importance |
| `housing_stock` | Primary vs. secondary homes |
| `geographical_referential` | Master reference for joins |

---

## 🧱 Tech Stack

| Tool | Role |
|------|------|
| **BigQuery** | Cloud data warehouse |
| **DBT** | Transformation, testing, documentation |
| **GitHub** | Collaboration & version control |
| **Looker Studio** | Dashboards & visual output |
| **Notion** | Agile task management & planning |

---

## 🚧 Agile Workflow

We’re working in sprints (iterations), following Agile best practices:
- **User stories**, specifications & acceptance criteria
- **Task ownership** (Josh, Anni, Marvel)
- **Incremental delivery** through Kanban
- **Retrospectives** to improve each round

Current user story:
> *"As a property hunter, I want to see a ranked list of French towns so I can target the most promising markets."*

---

## 👥 Team

| Name | Role |
|------|------|
| **Josh** | Project lead, DBT architect, Data analyst & visualization lead, BigQuery engineer & model dev

---

## 📊 Live Deliverables (Coming Soon)

- [ ] Ranked list of top French towns
- [ ] Looker dashboard of hot properties
- [ ] ML-powered price and popularity predictor

---

## 🗂️ Repo Structure

```bash
models/
├── staging/           # Raw table transformations
├── analyses/          # Final scoring logic
├── schema.yml         # Source + model documentation
prello/                # Notebook or custom SQL logic
README.md              # You are here
