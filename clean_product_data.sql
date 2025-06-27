---Add query untuk mebuat table product yang di bersihkan dan mengambil data yg perlu-----

  CREATE OR REPLACE TABLE `molten-castle-460910-e1.theLook_eCommerce.Product` AS
SELECT 
  id,
  UPPER(TRIM(brand)) AS brand_bersih,
  category,
  name AS nama_product,
  department,
  retail_price,
  cost,
  sku,
  distribution_center_id
FROM 
  `bigquery-public-data.thelook_ecommerce.products`;

----Untuk lihat jumlah product dan category product by Brand-----

SELECT 
   brand,
  COUNT (DISTINCT category) AS kategori_produk,
  COUNT(*) AS jumlah_produk,
FROM `molten-castle-460910-e1.theLook_eCommerce.Product`
GROUP BY 
brand 
ORDER BY
jumlah_produk DESC;
-->upper: seragam kapital semua 
-->Trim: buat hapus spasi
-> UNTUK TOTAL RETAIL PRICE PER BRAND---
SELECT
  brand_bersih,
  ROUND(SUM(retail_price)) AS total_retail
FROM 
  `molten-castle-460910-e1.theLook_eCommerce.Product`
GROUP BY
  brand_bersih
ORDER BY
total_retail DESC; 

----- untuk mengetahui jumlah kategori brand dan item brand----

SELECT 
   brand_bersih,
  COUNT (DISTINCT category) AS kategori_produk,
  COUNT(*) AS jumlah_produk,
FROM `molten-castle-460910-e1.theLook_eCommerce.Product`
GROUP BY 
brand_bersih
ORDER BY
jumlah_produk DESC;
