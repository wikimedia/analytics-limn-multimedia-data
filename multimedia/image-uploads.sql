select date('{from_timestamp}') as date,
	count(*) as {wiki}
	from {wiki}.image
	where img_major_mime = 'image' and
		img_timestamp >= '{from_timestamp}' and
		img_timestamp < '{to_timestamp}';