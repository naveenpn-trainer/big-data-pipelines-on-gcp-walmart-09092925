from google.cloud.bigquery import Client


def insert_records(project_id, dataset_name, table_name):
    bigquery_client = Client(project=project_id)

    table_id = f"{project_id}.{dataset_name}.{table_name}"
    records = [
        {
            "employee_id": 8 ,
            "employee_name": "Arjun",
         "experience" :35,
            "salary":200000
        }
    ]
    errors = bigquery_client.insert_rows_json(table_id, records)

    if errors == []:
        print(f"Successfully inserted {len(records)} rows into table {table_name}.")
    else:
        print(f"Failed to insert rows: {errors}")

if __name__ == '__main__':
    project_id = "upgradlabs-1749645486581"
    dataset_name = "retaildb"
    table_name = "employee"

    insert_records(project_id, dataset_name,table_name)