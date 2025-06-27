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

