-- SELECT state, city, COUNT(order_id) as num_orders
-- FROM `bike_store.customers` as customers
-- JOIN `bike_store.orders` as orders
-- ON customers.customer_id = orders.customer_id
-- GROUP BY state, city
-- ORDER BY num_orders DESC;

with order_by_city as (
    SELECT state, city, COUNT(order_id) as num_orders
    FROM {{ source('bike_store', 'customers') }} as customers
    JOIN {{ source('bike_store', 'orders') }} as orders
    ON customers.customer_id = orders.customer_id
    GROUP BY state, city
    ORDER BY num_orders DESC
),

final as (
    select * from order_by_city
) 

select * from final