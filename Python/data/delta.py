# https://mungingdata.com/pandas/read-delta-lake-dataframe/

#pip install delta-spark
#pip install pyspark
#pip install pandas

import pyspark
import delta-spark
import pandas

## Option 1: The delta-rs library makes this incredibly easy and doesn’t require any Spark dependencies.

# Use PySpark to create the a Delta Lake:
data = [("jose", 10), ("li", 12), ("luisa", 14)]
df = spark.createDataFrame(data, ["name", "num"])
df.write.format("delta").save("resources/delta/1")

# Here’s how to read the Delta Lake into a pandas DataFrame
from deltalake import DeltaTable
dt = DeltaTable("resources/delta/1")
df = dt.to_pandas()
print(df)

## Option 2: Reading Delta Lakes with PySpark. This is the best approach if you have access to a Spark runtime.
pyspark_df = (
    spark.read.format("delta").option("mergeSchema", "true").load("resources/delta/3")
)
pandas_df = pyspark_df.toPandas()

## I'd recommend writing the files as arrow or the like so they can be accessed 
