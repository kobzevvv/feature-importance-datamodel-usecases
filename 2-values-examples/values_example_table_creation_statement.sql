CREATE TABLE IF NOT EXISTS `your_project.your_dataset.value_examples` (
    table_name STRING OPTIONS(description="Name of the source table"),
    values_examples_array ARRAY<STRUCT<
        value STRING OPTIONS(description="Unique value found in the column"),
        popularity INT64 OPTIONS(description="Count of occurrences of the value in the column")
    >> OPTIONS(description="Array of top 100 most frequent values with their count")
)
OPTIONS(
    description="Stores the most frequent 100 values for each column in each table, along with their popularity."
);
