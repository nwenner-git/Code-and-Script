import psycopg2
import boto3
import pandas as pd

# Connect to Pipedrive database
conn = psycopg2.connect(
    host="your_host",
    database="your_database",
    user="your_user",
    password="your_password",
    port="your_port"
)

# Query the specified categories from Pipedrive
query = "SELECT * FROM deals UNION SELECT * FROM organizations UNION SELECT * FROM persons UNION SELECT * FROM products UNION SELECT * FROM activities UNION SELECT * FROM files UNION SELECT * FROM call_logs"

# Export the query result to an Excel file
df = pd.read_sql(query, conn)
df.to_excel("your_file_name.xlsx", index=False)

# Upload the Excel file to AWS S3
s3 = boto3.client("s3")
s3.upload_file("your_file_name.xlsx", "your_bucket_name", "your_object_name")
