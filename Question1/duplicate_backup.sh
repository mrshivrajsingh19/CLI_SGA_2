#!/bin/bash

SUBMISSIONS="submissions"
BACKUP="backup"
REPORT="report.txt"
ERRORS="errors.txt"

processed=0
duplicated=0
backed_up=0

> "$REPORT"
> "$ERRORS"

mkdir -p "$BACKUP"

for file in "$SUBMISSIONS"/*; do
    if [ -f "$file" ]; then
        processed=$((processed + 1))
        filename=$(basename "$file")
        duplicate=false

        for backup_file in "$BACKUP"/*; do
            if [ -f "$backup_file" ] && cmp -s "$file" "$backup_file"; then
                duplicate=true
                duplicated=$((duplicated + 1))
                break
            fi
        done

        if [ "$duplicate" = false ]; then
            if cp "$file" "$BACKUP/" 2>>"$ERRORS"; then
                backed_up=$((backed_up + 1))
            fi
        fi
    fi
done

echo "Assignment Submission Backup Report" > "$REPORT"
echo "Files Processed: $processed" >> "$REPORT"
echo "Duplicated Files: $duplicated" >> "$REPORT"
echo "Unique Files Backed Up: $backed_up" >> "$REPORT"
