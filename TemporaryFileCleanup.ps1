# Define paths to clean up
$tempPaths = @(
    "$env:Temp",
    "$env:SystemRoot\Temp",
    "$env:SystemRoot\Prefetch",
    "$env:UserProfile\AppData\Local\Temp"
)

# Define the age in days for files to be deleted
$fileAgeInDays = 7

# Function to clean up files older than a specified number of days
function Clean-UpFiles {
    param (
        [string]$path,
        [int]$days
    )
    
    # Get current date
    $currentDate = Get-Date
    
    # Get files older than specified days
    $filesToDelete = Get-ChildItem -Path $path -Recurse -Force | Where-Object { ($currentDate - $_.LastWriteTime).Days -ge $days }
    
    # Delete files
    foreach ($file in $filesToDelete) {
        try {
            Remove-Item -Path $file.FullName -Force -Recurse
            Write-Output "Deleted: $($file.FullName)"
        } catch {
            Write-Output "Failed to delete: $($file.FullName) - $($_.Exception.Message)"
        }
    }
}

# Clean up each defined path
foreach ($path in $tempPaths) {
    if (Test-Path -Path $path) {
        Write-Output "Cleaning up files in: $path"
        Clean-UpFiles -path $path -days $fileAgeInDays
    } else {
        Write-Output "Path does not exist: $path"
    }
}

Write-Output "Temporary file cleanup completed."
