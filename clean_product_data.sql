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
