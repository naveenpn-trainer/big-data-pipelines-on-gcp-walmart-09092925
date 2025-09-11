from google.cloud.bigquery import Client, SchemaField, Table

def create_table(project_id, datset_name, table_name):
    big_query_client = Client(project=project_id)
    dataset_id = f"{project_id}.{dataset_name}"
    table_id = f"{dataset_id}.{table_name}"

    employee_schema = [
        SchemaField("id", "INTEGER"),
        SchemaField("name", "STRING"),
        SchemaField("experience", "INTEGER"),
        SchemaField("salary", "INTEGER"),
    ]

    table = Table(table_id, schema=employee_schema)
    new_table = big_query_client.create_table(table, exists_ok=True)
    print(f"Table {new_table.table_id} created successfully in dataset {dataset_name}")


if __name__ == '__main__':
    project_id = "upgradlabs-1749645486581"
    dataset_name = "retaildb"
    create_table(project_id, dataset_name,"employee")