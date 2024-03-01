import requests
import boto3

api_token = '6a6c579ff3c778417cf4b8ce507694c6abbc1989'
url = 'https://api.pipedrive.com/v1/deals?api_token=' + api_token

response = requests.get(url)
data = response.json()

s3 = boto3.resource('s3')
bucket_name = 'your-bucket-name'
key = 'pipedrive-data.json'

s3.Object(bucket_name, key).put(Body=str(data))