select date('{from_timestamp}') as date,
	count(*) as {wiki}
	from {wiki}.logging
	where log_type = 'delete' and
		log_namespace = 6 and
		log_timestamp >= '{from_timestamp}' and
		log_timestamp < '{to_timestamp}';
