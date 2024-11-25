# Import the required module
Import-Module /opt/arm-ttk/arm-ttk/arm-ttk/arm-ttk.psd1

# Get all JSON files in the current directory
$jsonFiles = Get-ChildItem -Path . -Filter *.json

# Loop through each JSON file and execute the command
foreach ($file in $jsonFiles) {
    # Execute the command on the current JSON file
    Test-AzTemplate -TemplatePath $file.FullName
}

if ($LASTEXITCODE -ne 0) {
    Write-Host "Infra tests failed. Exiting with status 1."
    exit 1
} else {
    Write-Host "Infra tests passed."
}
