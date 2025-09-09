from pyspark.sql import SparkSession

spark = SparkSession.builder.master("local").appName("Demo App").getOrCreate()
print(type(spark))

df = spark.read.csv(path="../_resources/dataset/sample_dataset/users_001.csv",
                    header=True)
df.show(n=40, truncate=False)