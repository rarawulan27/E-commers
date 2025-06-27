--- Buat tau jumlah event yg terrealisasi atau tidak cancel-----
SELECT 
  event_type,
  uri,
  COUNT(*) AS jumlah_event
FROM 
  `bigquery-public-data.thelook_ecommerce.events`
WHERE 
  event_type NOT LIKE '%cancel%' AND uri NOT LIKE '/cancel'
GROUP BY 
  event_type, uri
LIMIT 1000
