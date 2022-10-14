-- Выбор всех работников с должностями seller и consultant
SELECT
  id,
  first_name || ' ' || last_name employee
FROM staff
  WHERE position_id = (SELECT id FROM staff_positions WHERE name = 'seller')
    OR position_id = (SELECT id FROM staff_positions WHERE name = 'consultant');


-- Выбор всех покупателей, у которых есть какая-либо скидка
SELECT
  id,
  first_name || ' ' || last_name customer
FROM customers
  WHERE id IN (SELECT customer_id FROM discounts WHERE customer_id IS NOT NULL);