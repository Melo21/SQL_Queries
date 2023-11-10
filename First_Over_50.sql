with ordered_trans as (select row_number() OVER (PARTITION BY user_id order by transaction_date) as rn
,user_id, spend from user_transactions )


select count(distinct user_id) as users from ordered_trans where rn = 1 and spend >=50
