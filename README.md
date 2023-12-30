# mTrash

## Description

This project is a PowerShell script that automatically deletes files and folders in a specified directory that have not been accessed for a certain period of time. The script is designed to help manage disk space by removing unused files and folders.
This is achieved by using the Windows Task Scheduler to execute the `DeleteFiles.ps1` script once every week.

## Getting Started

### Dependencies

* Windows OS
* PowerShell

### Installing

Clone the repository to your local machine

Very important: The directory containing the `DeleteFiles.ps1` script must be different from the directory that will be used to store the files and folders to be deleted. Otherwise, the script will delete itself.

### Manually Running the Script

* Open PowerShell
* Navigate to the directory containing the `DeleteFiles.ps1` script
* Run the script using the command `.\DeleteFiles.ps1`

### Setting Up the Task Scheduler

1. Open the Task Scheduler (you can search for it in the Start menu).
2. Click on "Create Basic Task...".
3. Name the task (e.g., "mTrash") and provide a description.
4. Choose "Weekly" as the trigger.
5. Set the start time and day of the week according to your preference.
6. Choose "Start a program" as the action.
7. In the "Program/script" field, enter the path to the PowerShell executable (e.g., `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe` or `powershell.exe`).

    Note: You can find the path to the PowerShell executable by running the command `Get-Command powershell.exe` in PowerShell.

8. In the "Add arguments (optional)" field, enter the path to the `DeleteFiles.ps1` script (e.g., `C:\.mTrash\DeleteFiles.ps1`).

    Note: Some versions of Windows may require you to add the `-ExecutionPolicy Bypass` flag to the "Add arguments (optional)" field.
So the "Add arguments (optional)" field would look like this: `-ExecutionPolicy Bypass C:\.mTrash\DeleteFiles.ps1`

9. Click "Finish" to create the task.

## Custom Context Menu

A custom context menu command is used to move selected files or folders to the specified directory. This is done using a software called Custom Context Menu.

### Setting Up the Custom Context Menu

1. Install Custom Context Menu from Microsoft Store. You can choose the free version or the paid version. There is no difference in functionality it's just that the paid version supports the developer.
2. Open the software and create a new command with the following settings:
    * Title: `mTrash`
    * Order: `0`
    * Exe: `cmd.exe`
    * Param: `/c move "{path}" "C:\mTrash"`
    (Note: You can change the path to the "mTrash" directory to whatever you want. Just make sure to set the same path in the `DeleteFiles.ps1` script. You must also create the directory before using the context menu command.)
    * Icon: `"C:\.mTrash\mTrash-96.ico"`
    (Note: You can change the icon to whatever you want. Just make sure to update the path to the icon in the command settings.)
    * Match Folder: `On`
    * Match File: `*`
    * Match Multi-File: `Each (execute [exe] on each path)`
3. Save the command and close the software.

Note: You may need to restart your computer for the context menu command to appear.

Now, you can right-click on any file or folder, select the "mTrash" command from the context menu, and the selected items will be moved to the "C:\mTrash" directory.

After a week, the files and folders in the "C:\mTrash" directory will be deleted automatically.

## Help

If you encounter any problems or have any questions about this script, please open an issue in this repository.

## Authors

Contributors names and contact info

* [medhallal](https://github.com/medhallal)

## Version History

* 0.1
    * Initial Release
* 0.2
    * Added some notices to the README & DeleteFiles.ps1 files


## License

This project is licensed under the [MIT License](LICENSE).

[//]: # (## Acknowledgments)

[//]: # (Inspiration, code snippets, etc.)

## How to Contribute

I welcome contributions from the community. Here are a few ways you can help:

* Add functionality: If you have a feature in mind, feel free to create an issue and discuss it. Once approved, you can fork the repository, make your changes, and submit a pull request.
* Improve documentation: If you notice any errors or room for improvement in the documentation, please update it and submit a pull request.
* Report bugs: If you find a bug, please create an issue detailing the problem and how to reproduce it. If you can fix the bug yourself, you can also submit a pull request with the fix.
