from pyspark.sql import SparkSession
from pyspark.sql.functions import col, max, min, avg

if __name__ == '__main__':
    spark = SparkSession.builder.appName("Demo App").getOrCreate()

    df = spark.read.csv(path="gs://walmart_09092025/retail_db/employees.csv",
                        header = True,
                        sep = "|",
                        inferSchema = True)

    result_df = df.filter(col("experience")>5)
    result_df.write.format("csv").save(path="gs://walmart_09092025/output",
                                       mode="overwrite")