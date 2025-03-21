WITH source_data AS (
    SELECT 
        t.*,
        v.values_distribution_type
    FROM `{{ target.database }}.{{ target.schema }}.your_source_table` t
    JOIN `{{ target.database }}.{{ target.schema }}.value_examples_with_columns_typisation` v
        ON t.table_name = v.table_name
        AND t.column_name = v.column_name
),

low_cardinality_features AS (
    SELECT 
        table_name,
        column_name,
        -- Generate tags for low-cardinality categorical columns
        CASE 
            WHEN values_distribution_type = "ready to use tag"
            THEN ARRAY_AGG(DISTINCT CONCAT(column_name, ":", CAST(value AS STRING)))
        END AS categorical_features
    FROM source_data
    WHERE values_distribution_type = "ready to use tag"
    GROUP BY table_name, column_name
),

datetime_features AS (
    SELECT 
        table_name,
        column_name,
        -- Extract seasonality features from datetime columns
        ARRAY_AGG(DISTINCT FORMAT_DATE('%A', SAFE_CAST(value AS DATE))) AS day_of_week,
        ARRAY_AGG(DISTINCT FORMAT_TIMESTAMP('%H', SAFE_CAST(value AS TIMESTAMP))) AS hour_of_day,
        ARRAY_AGG(DISTINCT FORMAT_DATE('%V', SAFE_CAST(value AS DATE))) AS week_number,
        ARRAY_AGG(DISTINCT FORMAT_DATE('%B', SAFE_CAST(value AS DATE))) AS month_name,
        ARRAY_AGG(
            DISTINCT 
            CASE 
                WHEN EXTRACT(MONTH FROM SAFE_CAST(value AS DATE)) IN (12, 1, 2) THEN 'Winter'
                WHEN EXTRACT(MONTH FROM SAFE_CAST(value AS DATE)) IN (3, 4, 5) THEN 'Spring'
                WHEN EXTRACT(MONTH FROM SAFE_CAST(value AS DATE)) IN (6, 7, 8) THEN 'Summer'
                WHEN EXTRACT(MONTH FROM SAFE_CAST(value AS DATE)) IN (9, 10, 11) THEN 'Autumn'
            END
        ) AS season
    FROM source_data
    WHERE values_distribution_type IN ('date', 'datetime')
    GROUP BY table_name, column_name
),

final_features AS (
    SELECT 
        d.table_name,
        ARRAY_CONCAT(
            IFNULL(c.categorical_features, []),
            IFNULL(d.day_of_week, []),
            IFNULL(d.hour_of_day, []),
            IFNULL(d.week_number, []),
            IFNULL(d.month_name, []),
            IFNULL(d.season, [])
        ) AS extracted_features
    FROM datetime_features d
    LEFT JOIN low_cardinality_features c
        ON d.table_name = c.table_name
)

SELECT * FROM final_features;
