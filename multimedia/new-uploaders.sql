select date('{from_timestamp}') as date,
	count(i.img_user) as {wiki_db}
	from (
		select img_user,
			min(img_timestamp) as timestamp
			from {wiki_db}.image
			group by img_user
	) firsts

	join {wiki_db}.image i
		on firsts.img_user = i.img_user
		and firsts.timestamp = i.img_timestamp
	
	where i.img_timestamp >= '{from_timestamp}' and
		i.img_timestamp < '{to_timestamp}';
