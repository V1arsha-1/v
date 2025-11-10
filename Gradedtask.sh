#!/bin/bash

# === Automatic Backup Script for Graded Tasks ===

# Folder to back up
SOURCE_DIR="$HOME/Graded_Tasks"

# Folder where backups will be stored
BACKUP_DIR="$HOME/Graded_Tasks_Backups"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Timestamp for unique backup name
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Name of the backup file
BACKUP_NAME="graded_task_backup_$TIMESTAMP.tar.gz"

# Create the backup using tar and gzip
tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$SOURCE_DIR" .

# Display success message
echo "✅ Backup completed!"
echo "📁 Backup file created at: $BACKUP_DIR/$BACKUP_NAME"
