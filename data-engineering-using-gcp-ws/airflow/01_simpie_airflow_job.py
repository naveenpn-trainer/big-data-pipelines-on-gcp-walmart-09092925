from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime


#
def print_hello_fn():
    print("Hello from airflow")

# Define efault argument for the DAG
default_args = {
    'owner':'airflow',
    'depends_on_past':False,
    'start_date':datetime(2025, 10, 1)
}
dag = DAG(
    'simple_airflow',
    default_args=default_args,
    description='A simple Airflow DAG',
    schedule_interval=None,
)

task_hello = PythonOperator(task_id="print_hello_task",
                            python_callable=print_hello_fn)
task_hello