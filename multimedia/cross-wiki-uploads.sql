select date('{from_timestamp}') as date,
	count(*) as {wiki_db}
	from {wiki_db}.tag_summary
		join {wiki_db}.recentchanges on
			ts_rc_id = rc_id
	where ts_tags="cross-wiki-upload" and
		rc_timestamp >= '{from_timestamp}' and
		rc_timestamp < '{to_timestamp}';
