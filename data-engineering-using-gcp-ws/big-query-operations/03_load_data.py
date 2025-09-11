from google.cloud.bigquery import Client, LoadJobConfig, SchemaField, SourceFormat


def load_file(project_id, dataset_name, table_name, gcs_path):
    client = Client(project=project_id)

    job_config = LoadJobConfig(
        schema=[
            SchemaField("employee_id", "INTEGER"),
            SchemaField("employee_name", "STRING"),
            SchemaField("experience", "INTEGER"),
            SchemaField("salary", "INTEGER"),
        ],
        source_format=SourceFormat.CSV,
        field_delimiter="|",
        skip_leading_rows=1,
        write_disposition="WRITE_TRUNCATE",
        encoding="UTF-8",
        quote_character='"',
        allow_quoted_newlines=True
    )

    table_id = f"{project_id}.{dataset_name}.{table_name}"
    job = client.load_table_from_uri(gcs_path, table_id, job_config=job_config)
    job.result()
    tbl = client.get_table(table_id)
    print(f"Loaded {tbl.num_rows} rows into {table_id}")

if __name__ == '__main__':
    project_id = "upgradlabs-1749645486581"
    dataset_name = "retaildb"
    table_name = "employee"
    file_path = "gs://walmart_09092025/retail_db/employees.csv"
    load_file(project_id, dataset_name,table_name,file_path)