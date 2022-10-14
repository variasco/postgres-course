-- Функция подсчитывающая количество единиц товара во всех магазинах и складах
CREATE FUNCTION number_of_products(productId INTEGER)
RETURNS BIGINT AS
$$
  SELECT DISTINCT
    sum(sp.remainder) OVER (PARTITION BY p.id)
  FROM products p
    JOIN stores_products sp ON sp.product_id = p.id
  WHERE p.id = productId;
$$
LANGUAGE SQL;
