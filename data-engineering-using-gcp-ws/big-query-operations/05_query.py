from google.cloud.bigquery import Client


def query_records(project_id, dataset_name, table_name):
    bigquery_client = Client(project=project_id)

    table_id = f"{project_id}.{dataset_name}.{table_name}"

    query_job = bigquery_client.query(f"""
                        SELECT employee_id, employee_name from `{table_id}`
                        """)
    records = query_job.result()
    for record in records:
        print(f"Employee Id: {record['employee_id']}, Name= {record['employee_name']}")



if __name__ == '__main__':
    project_id = "upgradlabs-1749645486581"
    dataset_name = "retaildb"
    table_name = "employee"

    query_records(project_id, dataset_name,table_name)