---Buat tau kalok performa pengiriman dari id order/performa pengiriman berapa lama------
SELECT
  order_id,
  TIMESTAMP_DIFF(shipped_at, created_at, DAY) AS days_to_ship,
  TIMESTAMP_DIFF(delivered_at, shipped_at, DAY) AS days_to_deliver
FROM
bigquery-public-data.thelook_ecommerce.orders
WHERE
  shipped_at IS NOT NULL AND delivered_at IS NOT NULL;
