with num_rides as (select row_number() 
                  over (PARTITION BY r.user_id order by ride_date) as rn
                  ,u.user_id,ride_date, registration_date
                  from rides r join users u on r.user_id = u.user_id)
,itm as (select * from num_rides where ride_date = registration_date
        and rn = 1)


select round(avg(n.ride_date-n.registration_date),2) from num_rides n 
join itm i on  n.user_id = i.user_id where n.rn = 2
