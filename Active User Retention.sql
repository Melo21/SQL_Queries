with MAU as (select user_id,
extract('month' from event_date) 
as month from user_actions where extract('month' from event_date) in (6,7))



select 7,count(user_id) from (select user_id,count(distinct month) from MAU 
GROUP BY 1 having count(distinct month) > 1) as agg
