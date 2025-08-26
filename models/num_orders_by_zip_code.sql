-- SELECT zip_code, COUNT(order_id) as num_orders
-- FROM `bike_store.customers` as customers
-- JOIN `bike_store.orders` as orders
-- ON customers.customer_id = orders.customer_id
-- GROUP BY zip_code
-- ORDER BY num_orders DESC;

with order_by_zipcode as (
    SELECT zip_code, COUNT(order_id) as num_orders
    FROM {{ source('bike_store', 'customers') }} as customers
    JOIN {{ source('bike_store', 'orders') }} as orders
    ON customers.customer_id = orders.customer_id
    GROUP BY zip_code
    ORDER BY num_orders DESC
),

final as (
    select * from order_by_zipcode
) 

select * from final