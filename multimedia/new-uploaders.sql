 select date('{from_timestamp}') as date,
        count(*) as {wiki_db}
   from (select img_user
           from {wiki_db}.image
          group by img_user
         having min(img_timestamp) >= '{from_timestamp}'
            and min(img_timestamp) < '{to_timestamp}'
        ) firsts_this_month
;
