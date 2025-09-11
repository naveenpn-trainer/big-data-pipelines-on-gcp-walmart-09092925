from pyspark.sql import SparkSession
from pyspark.sql.functions import col
spark = SparkSession.builder.master("local").appName("Demo App").getOrCreate()

employee_df = spark.read.csv(path="../_resources/dataset/employee.csv",
                             header=True,
                             sep="|",
                             inferSchema=True,
                             quote="'")
employee_df.show()

employee_df.printSchema()

# result_df = employee_df.select("id","name")
# result_df.show()

# employee_df.select(col("id").alias("user_id"),
#                    col("name")).show()

print(employee_df.columns)
columns_to_exclude = ["gen"]
# Not Recommended
# columns_to_include = []
# for c in employee_df.columns:
#     if c not in columns_to_exclude:
#         columns_to_include.append(c)

# Recommended
columns_to_include = [c for c in employee_df.columns if c not in columns_to_exclude]
employee_df.select(*columns_to_include).show()
# employee_df.select("id", "name", "exp")

# employee_df.filter(col("company")=="Infosys").select("name").show()