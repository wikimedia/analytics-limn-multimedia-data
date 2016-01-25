select date('{from_timestamp}') as date,
	count(*) as {wiki_db}
	from {wiki_db}.change_tag
		join {wiki_db}.logging on
			ct_log_id = log_id
	where ct_tag = "cross-wiki-upload" and
		log_type = "upload" and
		log_timestamp >= '{from_timestamp}' and
		log_timestamp < '{to_timestamp}';
