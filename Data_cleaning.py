# Import required libraries
import pandas as pd

import numpy as np

# Load the dataset
data=pd.read_csv("Sample - Superstore.csv",encoding='latin1')

df=pd.DataFrame(data)

# Display first 5 rows
print(df.head())

# Display dataset information
print(df.info())

# Display statistical summary
print(df.describe())


# Display statistical summary
print(df.dtypes)

# Check missing values
print(df.isnull().sum())

# Display column names
print(df.columns)

# Convert column names to lowercase
df.columns=df.columns.str.lower()

# Replace spaces and hyphens with underscore
df.columns=df.columns.str.replace(' ','_').str.replace('-','_')

# Display updated column names
df.columns

# Check unique values in important categorical columns
print(df['ship_mode'].unique())

print(df['segment'].unique())

print(df['state'].unique())

print(df['region'].unique())

print(df['category'].unique())

print(df['sub_category'].unique())

print(df['product_name'].unique())

# Drop unnecessary columns
df=df.drop(['product_id','postal_code','customer_id','order_id','country','product_name'],axis=1)

# Convert order_date column into datetime format
df['order_date']=pd.to_datetime(df['order_date'])

df['order_date'].dtype

df['order_date']

# Convert ship_date column into datetime format
df['ship_date']=pd.to_datetime(df['ship_date'])

df['ship_date'].dtype

df['ship_date'].head()

# Extract year from order_date
df['year']=df['order_date'].dt.year

# Count orders by year
df['year'].value_counts()

# Calculate shipping days
df['shipping_days']=(df['ship_date']-df['order_date']).dt.days

df['shipping_days'].unique()

# Create function to classify shipping status
def shipping_category(shipping_days):
  if shipping_days<=2:
    return 'Fast delivery'
  elif shipping_days<=6:
    return 'Standard delivery'
  else:
    return 'Delayed delivery'

# Apply shipping category function
df['ship_status']=df['shipping_days'].apply(shipping_category)

df['ship_status'].head()

print(df['ship_status'].value_counts())

print(df['ship_mode'].value_counts())

# Save cleaned dataset into CSV file
df.to_csv('superstore_cleaned.csv',index=False)

print("Saved as superstore cleaned")

# Import SQLAlchemy create_engine
from sqlalchemy import create_engine

# Create MySQL database connection
engine = create_engine(
    "mysql+pymysql://root:your_password@localhost/ecommerce"
)

# Upload cleaned data into MySQL table
df.to_sql(
    name='retail',
    con=engine,
    if_exists='replace',
    index=False
)

print("Data uploaded successfully")