with oe as (
  select 
    row_number() OVER (
      PARTITION BY TO_CHAR(measurement_time, 'DD/MM/YYYY') 
      ORDER BY 
        measurement_time
    ) as oee, 
    measurement_id, 
    measurement_value, 
    measurement_time 
  from 
    measurements
) 
select 
  CAST(measurement_time AS DATE) AS measurement_day, 
  sum(
    case when oee % 2 != 0 then measurement_value end
  ) as odd_sum, 
  sum(
    case when oee % 2 = 0 then measurement_value end
  ) as even_sum 
from 
  oe 
GROUP BY 
  1 
order by 
  1
