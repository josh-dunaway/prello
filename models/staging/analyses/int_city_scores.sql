{{config(materialized='table')}}

with tourism_kpi as (
  select 
    municipality_code,
    count(distinct poi) as n_pois
  from {{ref('stg_raw__POI_tourist_sites')}}
  group by municipality_code
),

salary_kpi as (
  select 
    municipality_code,
    avg_net_salary
  from {{ref('stg_raw__average_salary_by_municipality')}}
  where year = 2019
),

real_estate_kpi as (
  select 
    municipality_code,
    intensite_tension_immo
  from {{ref('stg_raw__real_estate_info_by_municipality')}}
  -- Optional: add year filter once year is confirmed
),

joined as (
  select 
    t.municipality_code,
    t.n_pois,
    s.avg_net_salary,
    r.intensite_tension_immo
  from tourism_kpi t
  left join salary_kpi s using (municipality_code)
  left join real_estate_kpi r using (municipality_code)
),

normalized as (
  select 
    municipality_code,
    
    -- Normalized KPI scores (Min-Max Scaling)
    (n_pois - min(n_pois) over()) / nullif(max(n_pois) over() - min(n_pois) over(), 0) as tourism_score,
    (avg_net_salary - min(avg_net_salary) over()) / nullif(max(avg_net_salary) over() - min(avg_net_salary) over(), 0) as salary_score,
    (intensite_tension_immo - min(intensite_tension_immo) over()) / nullif(max(intensite_tension_immo) over() - min(intensite_tension_immo) over(), 0) as tension_score

  from joined
),

final_score as (
  select 
    municipality_code,
    tourism_score,
    salary_score,
    tension_score,
    
    -- Weighted final score (equal weights for now)
    round(
      0.33 * tourism_score +
      0.33 * salary_score +
      0.33 * tension_score,
      4
    ) as prello_score

  from normalized
)

select 
    f.municipality_code,
    f. tourism_score,
    f.salary_score,
    f.tension_score,
    f. prello_score,
    g.city_name,
    g.latitude,
    g.longitude
from final_score f
left join {{ref("stg_raw__geographical_referential")}} g
on f.municipality_code = g.municipality_code
order by prello_score desc
