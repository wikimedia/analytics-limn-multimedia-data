SELECT
  DATE('{from_timestamp}') AS date,
  REPLACE(TRIM(TRAILING '\r\n' FROM event_message), '\t', '    ' ) AS message,
  COUNT(*) AS total
FROM log.UploadWizardExceptionFlowEvent_11772722
WHERE
  timestamp >= '{from_timestamp}' AND timestamp < '{to_timestamp}' AND
  event_url LIKE 'https://commons.wikimedia.org%' AND
  -- Errors known to come from browser extensions etc.
  event_message NOT LIKE '%toLowerCase%' AND
  event_message NOT LIKE '%extension is null%' AND
  event_message NOT LIKE '%__gCrWeb.autofill.extractForms%' AND
  event_message NOT LIKE '%Permission denied to access property "toString"%' AND
  event_message NOT LIKE "%Cannot set property 'tgt' of null%"
GROUP BY event_message HAVING total > 1
ORDER BY total DESC
LIMIT 20;
