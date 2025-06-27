---- Buat data set baru Event------
 CREATE OR REPLACE TABLE `molten-castle-460910-e1.theLook_eCommerce.Events` AS
SELECT 
  id AS event_id,
  sequence_number,
  session_id AS user_session,
  ip_address,
  event_type,
  uri,
  city,state,postal_code,traffic_source,browser,
  DATETIME(TIMESTAMP(created_at), 'Asia/Jakarta') AS created_at_wib,
 FROM `bigquery-public-data.thelook_ecommerce.events`
   
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
   
----funnel user behavior---
   
WITH session_event_flags AS (
  SELECT
    user_session,
    MAX(IF(event_type = 'home', 1, 0)) AS has_home,
    MAX(IF(event_type = 'product', 1, 0)) AS has_view,
    MAX(IF(event_type = 'cart', 1, 0)) AS has_cart,
    MAX(IF(event_type = 'purchase', 1, 0)) AS has_purchase
  FROM
    `bigquery-public-data.thelook_ecommerce.events`
  GROUP BY
    user_session
)

SELECT
  COUNTIF(has_home = 1) AS sesi_dari_home,
  COUNTIF(has_home = 1 AND has_purchase = 1) AS home_to_purchase,
  SAFE_DIVIDE(COUNTIF(has_home = 1 AND has_purchase = 1), COUNTIF(has_home = 1)) AS cr_home,

  COUNTIF(has_view = 1) AS sesi_lihat_produk,
  COUNTIF(has_view = 1 AND has_purchase = 1) AS view_to_purchase,
  SAFE_DIVIDE(COUNTIF(has_view = 1 AND has_purchase = 1), COUNTIF(has_view = 1)) AS cr_view,

  COUNTIF(has_cart = 1) AS sesi_cart,
  COUNTIF(has_cart = 1 AND has_purchase = 1) AS cart_to_purchase,
  SAFE_DIVIDE(COUNTIF(has_cart = 1 AND has_purchase = 1), COUNTIF(has_cart = 1)) AS cr_cart
FROM
  session_event_flags
> kalok mau bikin table baru ganti aja With jadi created 
> kalok pakek data base di project sednri ganti from nya jangan lupa
