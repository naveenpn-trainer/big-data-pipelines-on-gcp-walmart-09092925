from pyspark.sql import SparkSession

spark = SparkSession.builder.master("local").appName("Demo App").getOrCreate()


df = spark.read.json(path="../_resources/dataset/sample_dataset/users_004.json",
                     multiLine=True)
df.show()