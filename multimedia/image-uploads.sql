select date('{from_timestamp}') as date,
	count(*) as {wiki_db}
	from {wiki_db}.image
	where img_major_mime = 'image' and
		img_timestamp >= '{from_timestamp}' and
		img_timestamp < '{to_timestamp}';
