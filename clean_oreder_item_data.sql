--bersihin dan pindah data ----
CREATE OR REPLACE TABLE `molten-castle-460910-e1.theLook_eCommerce.Order Item ` AS
SELECT 
  id AS item_id,
  order_id,
  user_id,
  product_id,
  inventory_item_id,
  status AS status_item,
  sale_price,
  DATETIME(TIMESTAMP(created_at), 'Asia/Jakarta') AS created_at_wib,
  DATETIME(TIMESTAMP(shipped_at), 'Asia/Jakarta') AS shipped_at_wib,
  DATETIME(TIMESTAMP(delivered_at), 'Asia/Jakarta') AS delivered_at_wib,
  DATETIME(TIMESTAMP(returned_at), 'Asia/Jakarta') AS returned_at_wib
FROM `bigquery-public-data.thelook_ecommerce.order_items` 
