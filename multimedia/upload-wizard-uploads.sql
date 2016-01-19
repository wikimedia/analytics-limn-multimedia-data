select date('{from_timestamp}') as date,
	count(*) as {wiki_db}
	from {wiki_db}.categorylinks
	where cl_to = 'Uploaded_with_UploadWizard' and
		cl_timestamp >= '{from_timestamp}' and
		cl_timestamp < '{to_timestamp}';
