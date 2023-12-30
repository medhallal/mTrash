# mTrash: Delete files and folders that have not been accessed in 7 days
# Version: 0.2
# Author: medhallal
# Date: 2023-12-30
# License: MIT
# Website: medhallal.com
# GitHub: github.com/medhallal


# Specify the path of the folder
# This folder will be used to store the files and folders that will be deleted
$folder = "C:\mTrash" # Very important: Make sure that the folder exists, and that it is not where this script is located

# Get the current date and time
$now = Get-Date

# Get all the files in the folder
$files = Get-ChildItem -Path $folder -File

# Loop through each file
foreach ($file in $files) {

    # Get the last access time of the file
    $lastAccess = $file.LastAccessTime

    # Calculate the difference between the current date and time and the last access time of the file
    $diff = New-TimeSpan -Start $lastAccess -End $now

    # Check if the difference is greater than 30 days (1 months)
    if ($diff.Days -gt 7) {

        # Delete the file
        Remove-Item -Path $file.FullName -Force
    }
}

# Get all the folders in the directory
$folders = Get-ChildItem -Path $directory -Directory

# Loop through each folder
foreach ($folder in $folders) {

    # Get the last access time of the folder
    $lastAccess = $folder.LastAccessTime

    # Calculate the difference between the current date and time and the last access time of the folder
    $diff = New-TimeSpan -Start $lastAccess -End $now

    # Check if the difference is greater than 6 days
    if ($diff.Days -gt 7) {

        # Delete the folder
        Remove-Item -Path $folder.FullName -Force -Recurse -Confirm:$false
    }
}