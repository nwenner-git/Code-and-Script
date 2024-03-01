import psycopg2
import boto3
import pandas as pd

# Connect to Pipedrive database
conn = psycopg2.connect(
    host="aidahealthcare.pipedrive.com",
    database="aidahealthcare",
    user="your_user",
    password="your_password",
    port="443"
)

# Query the specified categories from Pipedrive
categories = ["deals", "organizations", "persons", "products", "activities", "files", "call_logs"]
for category in categories:
    query = f"SELECT * FROM {category}"
    df = pd.read_sql(query, conn)
    df.to_excel(f"{category}.xlsx", index=False)

    # Upload the Excel file to AWS S3
    s3 = boto3.client("s3")
    s3.upload_file(f"{category}.xlsx", "PipeDriveBackup", f"{category}.xlsx")
