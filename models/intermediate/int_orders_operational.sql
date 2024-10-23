select
    g_margin.orders_id,
    g_margin.date_date,
    ROUND(g_margin.margin + ship.shipping_fee - ship.logcost -ship.ship_cost,2) AS operational_margin,
    g_margin.revenue,
    g_margin.quantity,
    g_margin.purchase_cost,
    g_margin.margin AS gross_margin,
    ship.shipping_fee,
    ship.logcost,
    ship.ship_cost

FROM {{ref('int_orders_margin')}} AS g_margin
LEFT JOIN {{ref('stg_raw__ship')}} AS ship
USING(orders_id)
ORDER BY g_margin.orders_id DESC