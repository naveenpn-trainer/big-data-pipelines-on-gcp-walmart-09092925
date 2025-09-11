from google.cloud.bigquery import Client, Dataset

def create_dataset(project_id, dataset_name):
    bigquery_client = Client(project=project_id)
    dataset_id = f"{project_id}.{dataset_name}"
    dataset = Dataset(dataset_id)
    dataset.location = "ASIA-SOUTH1"

    new_dataset = bigquery_client.create_dataset(dataset, exists_ok=True)
    print(f"Dataset {new_dataset.dataset_id} created successfully")

if __name__ == '__main__':
    project_id = "upgradlabs-1749645486581"
    dataset_name = "retaildb"
    create_dataset(project_id, dataset_name)