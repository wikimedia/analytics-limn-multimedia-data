SELECT
  DATE('{from_timestamp}') AS date,
  REPLACE(event_code, '\t', '    ' ) AS code,
  COUNT(*) AS total
FROM log.UploadWizardErrorFlowEvent_11772725
WHERE
  timestamp >= '{from_timestamp}' AND timestamp < '{to_timestamp}' AND
  event_code LIKE 'api/%'
GROUP BY event_code HAVING total > 1
ORDER BY total DESC
LIMIT 20;
