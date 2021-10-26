SELECT 
    MONTH(w.created_at) AS mth,
    COUNT(w.website_session_id) AS sessions,
    COUNT(o.order_id) AS orders,
    SUM(o.price_usd) AS revenue,
    COUNT(o.order_id) / COUNT(w.website_session_id) as conversion,
    SUM(o.price_usd) - SUM(o.cogs_usd) as gross_profit
FROM
    website_sessions w
		LEFT JOIN
    orders o ON w.website_session_id = o.website_session_id
WHERE
    w.created_at BETWEEN '2013-01-01' AND '2013-12-31'
GROUP BY mth;

SELECT 
    COUNT(o.order_id) AS orders, w.device_type as device
FROM
    ORDERS o
        JOIN
    website_sessions w ON w.website_session_id = o.website_session_id
WHERE
    o.created_at BETWEEN '2013-01-01' AND '2013-12-31'
GROUP BY w.device_type;

SELECT 
    COUNT(o.order_id) AS orders, utm_source
FROM
    ORDERS o
        JOIN
    website_sessions w ON w.website_session_id = o.website_session_id
WHERE
    o.created_at BETWEEN '2013-01-01' AND '2013-12-31'
GROUP BY utm_source;
