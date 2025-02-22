# Important packages to be installed
# pip install pyodbc
# pip install azure-identity azure-keyvault-secrets

# Install ODBC driver for SQL Server in your respective machine Windows/Mac

# For Windows 
# Download the installer from this link
# https://learn.microsoft.com/en-us/sql/connect/odbc/download-odbc-driver-for-sql-server?view=sql-server-ver16#version-17
# Run the installer to install it

import pyodbc
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient

# Azure Key vault details
key_vault_url = "https://kv-demo-dev.vault.azure.net/"

# Connect to Azure Key Vault
credential = DefaultAzureCredential()
client = SecretClient(vault_url=key_vault_url,credential=credential)

# Fetch secrets from Azure Key Vault
server = client.get_secret("sql-server-name").value
database = "db-demo-dev"
username = client.get_secret("username").value
password = client.get_secret("password").value
driver = '{ODBC Driver 17 for SQL Server}'

# Create a connection to the database
try:
    connection = pyodbc.connect(
        f'DRIVER={driver};SERVER={server};PORT=1433;DATABASE={database};UID={username};PWD={password}'
    )
    print("Connection successful!")
    
    # Create a cursor from the connection
    cursor = connection.cursor()
    
    # Run a select query
    cursor.execute("SELECT * FROM [sales_mart].[sales]")
    
    # Fetch and display the results
    rows = cursor.fetchall()
    for row in rows:
        print(row)
        
except pyodbc.Error as e:
    print("Error in connection: ",e)
    
finally:
    # Close the connection
    if connection:
        connection.close()
        print("Connection closed.")