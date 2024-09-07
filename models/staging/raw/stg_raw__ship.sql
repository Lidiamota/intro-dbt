with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        CASE WHEN shipping_fee <> shipping_fee_1 THEN shipping_fee ELSE NULL END AS shipping_fee_1,
    ,
        logcost,
        CAST(ship_cost AS NUMERIC) AS ship_cost

    from source

)

select * from renamed
