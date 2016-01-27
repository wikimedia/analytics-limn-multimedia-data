select date('{from_timestamp}') as date,
	count(*) as {wiki}
	from {wiki}.image
	where img_media_type = 'VIDEO' and
		img_timestamp >= '{from_timestamp}' and
		img_timestamp < '{to_timestamp}';
