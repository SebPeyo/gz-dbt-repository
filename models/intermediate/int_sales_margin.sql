select
    sales.products_id,
    sales.date_date,
    sales.orders_id,
    sales.revenue,
    sales.quantity,
    products.purchase_price,
    ROUND(sales.quantity * products.purchase_price,2) AS purchase_cost,
    ROUND(sales.revenue - sales.quantity * products.purchase_price,2) AS margin
from {{ref('stg_raw__sales')}} AS sales
LEFT JOIN {{ref('stg_raw__product')}} AS products
    USING (products_id)
