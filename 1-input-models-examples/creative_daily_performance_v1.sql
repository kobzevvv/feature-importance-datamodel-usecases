WITH creative_performance AS (
    SELECT 
        1 AS creative_id,
        "Creative 1" AS creative_name,
        "carousel" AS ad_format,
        "image" AS media_type,
        DATE '2024-03-01' AS date,
        "US" AS country,
        100000 AS impressions,
        2500 AS clicks,
        150 AS conversions,
        500.00 AS cost_usd,
        3000.00 AS revenue_usd
    UNION ALL
    SELECT 
        2, "Creative 2", "single_image", "image", DATE '2024-03-01', "UK", 
        80000, 2000, 120, 400.00, 2400.00
    UNION ALL
    SELECT 
        3, "Creative 3", "video", "video", DATE '2024-03-01', "EU",
        120000, 3000, 200, 600.00, 4000.00
    UNION ALL
    SELECT 
        4, "Creative 4", "carousel", "image", DATE '2024-03-01', "CA",
        95000, 2200, 140, 450.00, 2800.00
    UNION ALL
    SELECT 
        5, "Creative 5", "single_image", "image", DATE '2024-03-01', "AU",
        70000, 1800, 100, 350.00, 2000.00
)

SELECT * FROM creative_performance;
