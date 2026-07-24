QUESTION 1 - EXPLANATIONS

1. mkdir -p submissions backup
Created directories for storing student submissions and backups.

2. Sample submission files
Created sample student submission files, including duplicate content, to demonstrate duplicate detection.

3. ls -l submissions
Listed the files with detailed information to verify that the sample submissions were created successfully.

4. duplicate_backup.sh
The shell script processes the submission files, detects duplicate content, and backs up only unique submissions.

5. cmp
The cmp command compares file contents byte by byte and is used to identify duplicate submissions.

6. cp
The cp command copies unique submission files into the backup directory.

7. Report generation
The script counts processed files, duplicate files, and successfully backed-up unique files and stores these results in report.txt.

8. Error handling
Errors from file-copy operations are redirected to errors.txt using 2>>, keeping error messages separate from the normal report.

9. Redirection and file handling
The > operator creates or clears output files, while 2>> redirects error messages and appends them to the error file. mkdir, cp, cmp, and shell loops provide the required file-handling operations.
