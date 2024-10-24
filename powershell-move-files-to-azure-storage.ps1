
# Secure the password from the environment variable
$encrypt_password = ConvertTo-SecureString -String $($env:password) -AsPlainText -Force

# Create credential object using the username and encrypted password
$credential = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $($env:username),$encrypt_password

# Connect to Azure account using the credential
Connect-AzAccount -Credential $credential -Tenant $($env:tenant) -Subscription $($env:subscription)

# Create the storage context
$storageContext = New-AzStorageContext -StorageAccountName $($env:storage_account_name) -StorageAccountKey $($env:storage_account_key)

# Get reference to the storage container
$container = Get-AzStorageContainer -Name 'datalake' -Context $storageContext


# the important doc files
$files = @("index.html", "catalog.json", "manifest.json")

# Iterate over the file names
foreach ($fileName in $files) {

    # Append the root path to the file name to get the full path
    $filePath = Join-Path -Path $env:FILE_PATH -ChildPath "target/$fileName"

    # Dynamically set the blob name (e.g., "raw/azure_active_directory/file_yyyy_MM_dd.csv")
    $blobPath = "raw/dbt_docs/$fileName"

    # somethign to read on the logs
    echo $filePath 
    echo getting moved to 
    echo $blobName

    # move the file to blob
    Set-AzStorageBlobContent -container "datalake" -File $filePath -Blob $blobPath -Context $storageContext -Force 

}