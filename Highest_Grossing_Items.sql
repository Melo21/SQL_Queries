-- return top two items in each category 
-- f 2022

with item_agg as (
  select 
    category, 
    product, 
    sum(spend) as total_spend 
  from 
    product_spend 
  where 
    extract(
      year 
      from 
        transaction_date
    ) = 2022 
  GROUP BY 
    1, 
    2
), 
products_ranked as (
  select 
    category, 
    product, 
    dense_rank() over (
      PARTITION BY category 
      order by 
        total_spend desc
    ) as ranked 
  from 
    item_agg
) 
select 
  pr.category, 
  pr.product, 
  total_spend 
from 
  products_ranked pr 
  JOIN item_agg ia on pr.product = ia.product 
where 
  ranked = 1 
  or ranked = 2
