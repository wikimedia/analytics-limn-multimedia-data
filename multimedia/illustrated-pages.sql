select date('{from_timestamp}') as date, count(*) as {wiki}
	from (select title, namespace, count, rev_timestamp
		from project_illustration.{wiki}_delta
		group by title, namespace
		having max(rev_timestamp) < '{to_timestamp}'
			and count > 0
	);
