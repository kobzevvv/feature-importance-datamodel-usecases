{% macro generate_top_100_values(target_table) %}
    {% set columns_query %}
        SELECT column_name
        FROM `{{ target.database }}.{{ target.schema }}.INFORMATION_SCHEMA.COLUMNS`
        WHERE table_name = '{{ target_table }}'
    {% endset %}

    {% set columns = run_query(columns_query).columns[0].values() %}

    {%- set sql_queries = [] -%}

    {% for column in columns %}
        {%- set query -%}
            SELECT 
                '{{ target_table }}' AS table_name,
                ARRAY_AGG(
                    STRUCT(
                        CAST({{ column }} AS STRING) AS value,
                        COUNT(*) AS popularity
                    ) ORDER BY popularity DESC LIMIT 100
                ) AS values_examples_array
            FROM `{{ target.database }}.{{ target.schema }}.{{ target_table }}`
            WHERE {{ column }} IS NOT NULL
        {%- endset -%}
        {{ sql_queries.append(query) }}
    {% endfor %}

    {%- set final_query -%}
        INSERT INTO `{{ target.database }}.{{ target.schema }}.value_examples`
        SELECT table_name, values_examples_array
        FROM (
            {{ sql_queries | join(" UNION ALL ") }}
        )
    {%- endset -%}

    {{ return(final_query) }}
{% endmacro %}
