select date('{from_timestamp}') as date,
		count(distinct title, namespace) as {wiki}
	from project_illustration.{wiki}_delta
	where count = delta
		and rev_timestamp >= '{from_timestamp}'
		and rev_timestamp < '{to_timestamp}';
