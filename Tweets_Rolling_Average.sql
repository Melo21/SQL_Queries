select 
  user_id, 
  tweet_date, 
  round(
    avg(tweet_count) over (
      PARTITION BY user_id ROWS BETWEEN 2 PRECEDING 
      AND CURRENT ROW
    ), 
    2
  ) as running_total 
from 
  tweets
