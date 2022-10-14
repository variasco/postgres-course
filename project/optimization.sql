-- Возьмем следующий запрос
SELECT DISTINCT
  o.id order_id,
  c.first_name || ' ' || c.last_name customer,
  sum(p.price * op.quantity) OVER (PARTITION BY o.id)
FROM orders_products op
JOIN products p ON p.id = op.product_id
RIGHT JOIN orders o ON op.order_id = o.id
JOIN customers c ON c.id = o.customer_id
ORDER BY o.id;

-- Построим план выполнения запроса
EXPLAIN ANALYZE
SELECT DISTINCT
  o.id order_id,
  c.first_name || ' ' || c.last_name customer,
  sum(p.price * op.quantity) OVER (PARTITION BY o.id)
FROM orders_products op
  JOIN products p ON p.id = op.product_id
  RIGHT JOIN orders o ON op.order_id = o.id
  JOIN customers c ON c.id = o.customer_id
ORDER BY o.id;

-- Unique  (cost=35.49..36.49 rows=100 width=68) (actual time=9.667..10.002 rows=100 loops=1)
--    ->  Sort  (cost=35.49..35.74 rows=100 width=68) (actual time=9.665..9.715 rows=129 loops=1)
--          Sort Key: o.id, ((((c.first_name)::text || ' '::text) || (c.last_name)::text)), (sum((p.price * (op.quantity)::numeric)) OVER (?))
--          Sort Method: quicksort  Memory: 34kB
--          ->  WindowAgg  (cost=29.42..32.17 rows=100 width=68) (actual time=1.544..9.426 rows=129 loops=1)
--                ->  Sort  (cost=29.42..29.67 rows=100 width=37) (actual time=1.522..1.577 rows=129 loops=1)
--                      Sort Key: o.id
--                      Sort Method: quicksort  Memory: 34kB
--                      ->  Hash Join  (cost=23.35..26.10 rows=100 width=37) (actual time=0.632..1.273 rows=129 loops=1)
--                            Hash Cond: (o.customer_id = c.id)
--                            ->  Hash Right Join  (cost=19.10..21.58 rows=100 width=28) (actual time=0.379..0.818 rows=129 loops=1)
--                                  Hash Cond: (op.order_id = o.id)
--                                  ->  Hash Join  (cost=15.85..18.06 rows=96 width=24) (actual time=0.105..0.355 rows=96 loops=1)
--                                        Hash Cond: (op.product_id = p.id)
--                                        ->  Seq Scan on orders_products op  (cost=0.00..1.96 rows=96 width=12) (actual time=0.023..0.063 rows=96 loops=1)
--                                        ->  Hash  (cost=12.60..12.60 rows=260 width=20) (actual time=0.061..0.063 rows=22 loops=1)
--                                              Buckets: 1024  Batches: 1  Memory Usage: 9kB
--                                              ->  Seq Scan on products p  (cost=0.00..12.60 rows=260 width=20) (actual time=0.009..0.028 rows=22 loops=1)
--                                  ->  Hash  (cost=2.00..2.00 rows=100 width=8) (actual time=0.251..0.252 rows=100 loops=1)
--                                        Buckets: 1024  Batches: 1  Memory Usage: 12kB
--                                        ->  Seq Scan on orders o  (cost=0.00..2.00 rows=100 width=8) (actual time=0.021..0.091 rows=100 loops=1)
--                            ->  Hash  (cost=3.00..3.00 rows=100 width=17) (actual time=0.229..0.230 rows=100 loops=1)
--                                  Buckets: 1024  Batches: 1  Memory Usage: 14kB
--                                  ->  Seq Scan on customers c  (cost=0.00..3.00 rows=100 width=17) (actual time=0.026..0.109 rows=100 loops=1)
--  Planning Time: 1.169 ms
--  Execution Time: 10.178 ms
-- (26 rows)


-- Больше всего времени занимает сортировка, следом идет объединение таблиц. Потенциально улучшить время мы можем добавив индексирование внешних ключей. При больших объемах хранимых данных это позволит ускорить выполнение запроса
SELECT indexname FROM pg_indexes WHERE tablename = 'orders';
--   indexname  
-- -------------
--  orders_pkey
-- (1 row)

SELECT indexname FROM pg_indexes WHERE tablename = 'orders_products';
--       indexname       
-- ----------------------
--  orders_products_pkey
-- (1 row)

-- Добавим индексы для orders.customer_id и orders_products.product_id
CREATE INDEX orders_products_product_id_fkey ON orders_products (product_id);
CREATE INDEX orders_customer_id_fkey ON orders (customer_id);

-- Проведем новый анализ
-- Unique  (cost=35.49..36.49 rows=100 width=68) (actual time=4.064..4.400 rows=100 loops=1)
--    ->  Sort  (cost=35.49..35.74 rows=100 width=68) (actual time=4.063..4.111 rows=129 loops=1)
--          Sort Key: o.id, ((((c.first_name)::text || ' '::text) || (c.last_name)::text)), (sum((p.price * (op.quantity)::numeric)) OVER (?))
--          Sort Method: quicksort  Memory: 34kB
--          ->  WindowAgg  (cost=29.42..32.17 rows=100 width=68) (actual time=1.549..3.859 rows=129 loops=1)
--                ->  Sort  (cost=29.42..29.67 rows=100 width=37) (actual time=1.519..2.642 rows=129 loops=1)
--                      Sort Key: o.id
--                      Sort Method: quicksort  Memory: 34kB
--                      ->  Hash Join  (cost=23.35..26.10 rows=100 width=37) (actual time=0.633..1.313 rows=129 loops=1)
--                            Hash Cond: (o.customer_id = c.id)
--                            ->  Hash Right Join  (cost=19.10..21.58 rows=100 width=28) (actual time=0.349..0.828 rows=129 loops=1)
--                                  Hash Cond: (op.order_id = o.id)
--                                  ->  Hash Join  (cost=15.85..18.06 rows=96 width=24) (actual time=0.116..0.329 rows=96 loops=1)
--                                        Hash Cond: (op.product_id = p.id)
--                                        ->  Seq Scan on orders_products op  (cost=0.00..1.96 rows=96 width=12) (actual time=0.023..0.062 rows=96 loops=1)
--                                        ->  Hash  (cost=12.60..12.60 rows=260 width=20) (actual time=0.061..0.062 rows=22 loops=1)
--                                              Buckets: 1024  Batches: 1  Memory Usage: 9kB
--                                              ->  Seq Scan on products p  (cost=0.00..12.60 rows=260 width=20) (actual time=0.009..0.028 rows=22 loops=1)
--                                  ->  Hash  (cost=2.00..2.00 rows=100 width=8) (actual time=0.221..0.223 rows=100 loops=1)
--                                        Buckets: 1024  Batches: 1  Memory Usage: 12kB
--                                        ->  Seq Scan on orders o  (cost=0.00..2.00 rows=100 width=8) (actual time=0.024..0.094 rows=100 loops=1)
--                            ->  Hash  (cost=3.00..3.00 rows=100 width=17) (actual time=0.273..0.274 rows=100 loops=1)
--                                  Buckets: 1024  Batches: 1  Memory Usage: 14kB
--                                  ->  Seq Scan on customers c  (cost=0.00..3.00 rows=100 width=17) (actual time=0.024..0.110 rows=100 loops=1)
--  Planning Time: 2.821 ms
--  Execution Time: 4.573 ms
-- (26 rows)

-- Время выполнения уменьшилось в 2,2 раза или на 55%