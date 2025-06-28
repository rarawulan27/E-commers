---Buat tau kalok performa pengiriman dari id order/performa pengiriman berapa lama------
SELECT
  order_id,
  TIMESTAMP_DIFF(shipped_at, created_at, DAY) AS days_to_ship,
  TIMESTAMP_DIFF(delivered_at, shipped_at, DAY) AS days_to_deliver
FROM
bigquery-public-data.thelook_ecommerce.orders
WHERE
  shipped_at IS NOT NULL AND delivered_at IS NOT NULL;
-----Buat tau loyal customer----
SELECT
  first_name
  user_id,
  COUNT(order_id) AS total_orders,
  CASE 
    WHEN COUNT(order_id) = 1 THEN 'New Customer'
    WHEN COUNT(order_id) <= 3 THEN 'Returning Customer'
    ELSE 'Loyal Customer'
  END AS customer_segment
 FROM `molten-castle-460910-e1.Kpi_clean_data.v_clean_order_data` 
 GROUP BY user_id 
