CREATE FUNCTION updated_at_column_trigger()
RETURNS TRIGGER AS
$$
  BEGIN
    NEW.updated_at = now(); 
    RETURN NEW;
  END;
$$
LANGUAGE PLPGSQL;

CREATE TRIGGER on_update_stores_products BEFORE UPDATE ON stores_products
  FOR EACH ROW
  EXECUTE FUNCTION updated_at_column_trigger();

CREATE TRIGGER on_update_orders_products BEFORE UPDATE ON orders_products
  FOR EACH ROW
  EXECUTE FUNCTION updated_at_column_trigger();