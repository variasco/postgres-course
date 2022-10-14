-- Вывод всех заказов с суммой заказа
SELECT DISTINCT
  o.id order_id,
  c.first_name || ' ' || c.last_name customer,
  sum(p.price * op.quantity) OVER (PARTITION BY o.id)
FROM orders_products op
JOIN products p ON p.id = op.product_id
RIGHT JOIN orders o ON op.order_id = o.id
JOIN customers c ON c.id = o.customer_id
ORDER BY o.id;

-- Вывод товаров, которые хранятся на складах
SELECT
  s.id,
  p.name,
  sp.remainder
FROM stores_products sp
RIGHT JOIN stores s ON s.id = sp.store_id
JOIN products p ON p.id = sp.product_id
WHERE s.manager_id IS NULL
ORDER BY s.id, p.name;