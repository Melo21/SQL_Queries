#Photoshop Revenue Analysis

select 
  customer_id, 
  sum(
    case when product = 'Photoshop' then 0 else revenue end
  ) as revenue 
from 
  adobe_transactions 
where 
  customer_id in (
    select 
      customer_id 
    from 
      adobe_transactions 
    where 
      product = 'Photoshop'
  ) 
group by 
  1
