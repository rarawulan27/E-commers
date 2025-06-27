---Add query untuk membuat tabel user yang sudah dibersihkan----

CREATE OR REPLACE TABLE `molten-castle-460910-e1.theLook_eCommerce.User_id` AS
SELECT 
  id,
  CONCAT(first_name, ' ', last_name) AS nama_lengkap,
  DATETIME(TIMESTAMP(created_at), 'Asia/Jakarta') AS created_at_wib,
  email,
  age,
  gender,
  state,country,traffic_source
FROM 
  `bigquery-public-data.thelook_ecommerce.users`;
----Membersihkan row time yg ada indikasi boot-----

CREATE OR REPLACE TABLE `molten-castle-460910-e1.theLook_eCommerce.User_id_cleaned` AS
SELECT *
FROM `molten-castle-460910-e1.theLook_eCommerce.User_id`
WHERE created_at_wib <= '2025-06-01 00:00:00';


----Buat tau kalok performa pengiriman dari id order/performa pengiriman berapa lama------
SELECT
  order_id,
  TIMESTAMP_DIFF(shipped_at, created_at, DAY) AS days_to_ship,
  TIMESTAMP_DIFF(delivered_at, shipped_at, DAY) AS days_to_deliver
FROM
bigquery-public-data.thelook_ecommerce.orders
WHERE
  shipped_at IS NOT NULL AND delivered_at IS NOT NULL;
---Buat tau kalok tipe event dan total event-----
SELECT 
  event_type,
  COUNT(*) AS total_event
FROM 
  `bigquery-public-data.thelook_ecommerce.events`
GROUP BY 
  event_type
ORDER BY 
  total_event DESC;

