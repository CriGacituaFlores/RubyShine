class TriggerRefreshCustomerDetails < ActiveRecord::Migration[5.0]
  def up
  	execute %{
  		CREATE OR REPLACE FUNCTION
  			refresh_customer_details()
  			RETURNS TRIGGER LANGUAGE PLPGSQL
  		AS $$
  		BEGIN
  			REFRESH MATERIALIZED VIEW CONCURRENTLY customer_details;
  			RETURN NULL;
  		EXCEPTION
  			WHEN feature_not_supported THEN
  				RETURN NULL;
  		END $$;
  	}

		execute %{
			CREATE TRIGGER refresh_customer_details
			AFTER
				INSERT OR
				UPDATE OR
				DELETE
			ON customers
				FOR EACH STATEMENT
					EXECUTE PROCEDURE
						refresh_customer_details()
		}

    execute %{
      CREATE TRIGGER refresh_customer_details
      AFTER
        INSERT OR
        UPDATE OR
        DELETE
      ON customers_shipping_addresses
        FOR EACH STATEMENT
          EXECUTE PROCEDURE
            refresh_customer_details()
    }

    execute %{
      CREATE TRIGGER refresh_customer_details
      AFTER
        INSERT OR
        UPDATE OR
        DELETE
      ON customers_billing_addresses
        FOR EACH STATEMENT
          EXECUTE PROCEDURE
            refresh_customer_details()
    }

    execute %{
      CREATE TRIGGER refresh_customer_details
      AFTER
        INSERT OR
        UPDATE OR
        DELETE
      ON addresses
        FOR EACH STATEMENT
          EXECUTE PROCEDURE
            refresh_customer_details()
    }
  end
end
