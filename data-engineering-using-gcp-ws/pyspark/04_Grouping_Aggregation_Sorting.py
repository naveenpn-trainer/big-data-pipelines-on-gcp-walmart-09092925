from pyspark.sql import SparkSession
from pyspark.sql.functions import col, max, min, avg
spark = SparkSession.builder.master("local").appName("Demo App").getOrCreate()

employee_df = spark.read.csv(path="../_resources/dataset/employee.csv",
                             header=True,
                             sep="|",
                             inferSchema=True,
                             quote="'")
employee_df.show()
# employee_df.groupBy("desig").count().show()
employee_df.groupBy("desig").agg(max("exp").alias("min_exp"),
                                 min("exp").alias("max_exp"),
                                 avg("exp").alias("avg_exp")).show()