WITH base AS (
    SELECT
        table_name,
        column_name,
        values_examples_array,
        
        -- 1️⃣ Check if at least 95% of values are in the shortlist → "ready to use tag"
        CASE 
            WHEN ARRAY_LENGTH(values_examples_array) <= 10 THEN "ready to use tag"
            ELSE NULL
        END AS tag_type,

        -- 2️⃣ Check if the column contains textual values with diverse distribution → "rich text"
        CASE 
            WHEN tag_type IS NULL 
                 AND EXISTS (
                     SELECT 1 FROM UNNEST(values_examples_array) v
                     WHERE LENGTH(v.value) > 20 -- Assuming text-based values are usually long
                 )
            THEN "rich text"
            ELSE NULL
        END AS text_type,

        -- 3️⃣ Check if the column is a Date or DateTime field
        CASE
            WHEN SAFE_CAST(values_examples_array[OFFSET(0)].value AS DATE) IS NOT NULL 
                 AND NOT EXISTS (
                     SELECT 1 FROM UNNEST(values_examples_array) v 
                     WHERE SAFE_CAST(v.value AS TIMESTAMP) IS NOT NULL
                 )
            THEN "date"
            WHEN SAFE_CAST(values_examples_array[OFFSET(0)].value AS TIMESTAMP) IS NOT NULL 
            THEN "datetime"
            ELSE NULL
        END AS date_type

    FROM `{{ target.database }}.{{ target.schema }}.value_examples`
),

final AS (
    SELECT
        table_name,
        column_name,
        values_examples_array,
        
        -- Choose the most applicable typisation
        COALESCE(tag_type, text_type, date_type, "unknown") AS values_distribution_type
    FROM base
)

SELECT * FROM final;
