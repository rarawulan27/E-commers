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
Add query untuk membuat tabel user yang sudah dibersihkan
