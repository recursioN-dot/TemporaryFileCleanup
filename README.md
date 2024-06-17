# Temporary File Cleanup
This PowerShell script is designed to clean up temporary files older than a specified number of days from various system paths. 
These Temp files never get deleted and with time it takes up a large amount of storage.
The idea here is to automate the script using Windows Task Scheduler so you don't have to run it yourself. 
This will also ensure that Temp files are always deleted and that they never get too large.
This script targets the following directories:

- System Temp directory
- Windows Temp directory
- Prefetch directory
- User Temp directory


# Script Overview
The script performs the following tasks:
- Defines the paths to clean up.
- Sets the file age threshold for deletion (7 days by default).
- Defines a function to delete files older than the specified number of days.
- Iterates through each defined path and performs the cleanup if the path exists.
- Outputs the results of the cleanup process.

# Prerequisites
- Ensure you have the necessary permissions to delete files from the specified directories.
