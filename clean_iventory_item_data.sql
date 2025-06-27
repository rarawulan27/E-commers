--- MENGURUTKAN DATA SESUAI KEBUTUHAN---- 
CREATE OR REPLACE TABLE `molten-castle-460910-e1.theLook_eCommerce. Inventory Items` AS
SELECT 
  id,
  product_id AS id_product,
  product_sku AS sku_product,
  product_brand AS brand_product,
  product_category AS category_product,
  product_name AS name_product,
  product_department AS department_product,
  product_retail_price AS retail_price_product,
  cost AS cost_product,
  DATETIME(TIMESTAMP(created_at), 'Asia/Jakarta') AS created_at_wib,
  DATETIME(TIMESTAMP(sold_at), 'Asia/Jakarta') AS sold_at_wib
 FROM `bigquery-public-data.thelook_ecommerce.inventory_items` LIMIT 1000
