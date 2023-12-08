select user_id, spend, transaction_date FROM

(SELECT ROW_NUMBER() OVER (PARTITION BY USER_ID ORDER BY TRANSACTION_DATE),* FROM transactions)
as numbered where row_number = 3
