CREATE VIEW customers_with_orders AS
SELECT
  o.id order_id,
  c.id customer_id,
  c.first_name,
  c.last_name,
  p.name product_name,
  op.quantity
FROM customers c
  JOIN orders o ON o.customer_id = c.id
  JOIN orders_products op ON op.order_id = o.id
  JOIN products p ON p.id = op.product_id
ORDER BY order_id;

CREATE VIEW stored_products AS
SELECT
  p.id product_id,
  p.name product_name,
  s.id store_id,
  sp.remainder
FROM products p
  JOIN stores_products sp ON sp.product_id = p.id
  JOIN stores s ON s.id = sp.store_id
ORDER BY product_id;