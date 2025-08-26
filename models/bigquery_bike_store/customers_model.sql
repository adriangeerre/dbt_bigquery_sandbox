with customers_data as (
    select * from {{ source('bike_store', 'customers') }}
),

final as (
    select * from customers_data
) 

select * from final