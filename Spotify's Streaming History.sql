with song_week as (select user_id,song_id,count(listen_time) as song_plays from songs_weekly where listen_time <= '08/05/2022'
GROUP BY 1,2)


select user_id,song_id,sum(song_plays) 
FROM
(select user_id,song_id,song_plays FROM songs_history
UNION ALL
SELECT user_id,song_id,song_plays FROM song_week) as totaled
GROUP BY 1,2 ORDER BY 3 desc
