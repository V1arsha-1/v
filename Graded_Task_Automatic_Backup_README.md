# 🧾 Graded Task Automatic Backup

## 📘 Overview
The **Graded Task Automatic Backup** project is a **Bash automation script** that automatically creates compressed backups of your important project or assignment files.  
It’s designed for students, developers, and professionals who need to ensure their work is securely stored and easily recoverable.

This script can be run manually or set up as a **cron job** to back up your files at regular intervals (daily, weekly, etc.), ensuring data safety and version tracking.

---

## ✨ Features
- 🗂️ **Automatic Folder Backup:** Backs up all files from a specified source folder.  
- 🕒 **Timestamped Archives:** Each backup is uniquely named with a date and time stamp.  
- 💾 **Compressed Files:** Uses `tar` and `gzip` to reduce backup size.  
- 🔄 **Automatic Directory Creation:** Creates destination backup folders automatically if they don’t exist.  
- 🧠 **Simple to Customize:** Change just two variables (`SOURCE_DIR` and `BACKUP_DIR`) to adapt it for any project.  
- ⚙️ **Cron Integration:** Can be scheduled to run automatically without manual intervention.

---

## 🧩 Project Structure
```
GradedTaskBackup/
│
├── Gradedtask.sh             # Main Bash backup script
├── README.md                 # Documentation file (this file)
├── Graded_Tasks/             # Folder containing assignments or files to back up
└── Graded_Tasks_Backups/     # Folder where backups will be saved
```

---

## ⚙️ Installation & Setup

### 1️⃣ Create Folders
Open your terminal and run:
```bash
mkdir -p ~/Graded_Tasks
mkdir -p ~/Graded_Tasks_Backups
```

### 2️⃣ Add Files
Place your files or assignments inside the folder:
```
~/Graded_Tasks/
```

### 3️⃣ Create the Script
Run the following command:
```bash
nano Gradedtask.sh
```

Paste this script inside:

```bash
#!/bin/bash
# === Graded Task Automatic Backup ===
# Author: Varsha P
# Description: Automates backup of assignment folders into timestamped archives

# Folder to back up
SOURCE_DIR="$HOME/Graded_Tasks"

# Folder where backups will be stored
BACKUP_DIR="$HOME/Graded_Tasks_Backups"

# Create backup directory if not present
mkdir -p "$BACKUP_DIR"

# Generate timestamp for unique file name
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Define backup file name
BACKUP_NAME="graded_task_backup_$TIMESTAMP.tar.gz"

# Compress and backup the folder
tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$SOURCE_DIR" .

# Display status messages
echo "------------------------------------------"
echo " 🧾  Graded Task Automatic Backup Utility"
echo "------------------------------------------"
echo "✅ Backup Completed Successfully!"
echo "📦 Backup File: $BACKUP_DIR/$BACKUP_NAME"
echo "⏰ Created On: $(date)"
echo "------------------------------------------"
```

Save and exit (`Ctrl + O`, `Enter`, `Ctrl + X`).

---

### 4️⃣ Give Execute Permission
```bash
chmod +x Gradedtask.sh
```

### 5️⃣ Run the Script
```bash
./Gradedtask.sh
```

Expected output:
```
✅ Backup Completed Successfully!
📦 Backup File: /home/user/Graded_Tasks_Backups/graded_task_backup_2025-11-10_10-45-30.tar.gz
```

---

## ⏰ Automating Backups (Cron Job)

To schedule automatic daily backups:

1. Open the cron editor:
   ```bash
   crontab -e
   ```
2. Add this line (runs every day at 7 PM):
   ```
   0 19 * * * /path/to/Gradedtask.sh
   ```
3. Save and exit.  
   Cron will now automatically back up your folder daily at 7 PM.

---

## 🔍 Example Output Structure
After a few runs, your backup folder will look like this:

```
Graded_Tasks_Backups/
├── graded_task_backup_2025-11-10_09-00-00.tar.gz
├── graded_task_backup_2025-11-10_19-00-00.tar.gz
└── graded_task_backup_2025-11-11_09-00-00.tar.gz
```

Each backup file is timestamped for easy version identification.

---

## 🧰 Requirements
- Operating System: Linux / Ubuntu / WSL (Windows Subsystem for Linux)
- Shell: Bash
- Utilities: `tar`, `gzip`, and `cron` (preinstalled on most systems)

---

## 🧠 Troubleshooting

| Issue | Cause | Solution |
|-------|--------|-----------|
| `chmod: cannot access 'Gradedtask.sh'` | File not created or wrong directory | Run `ls` to verify file exists, then `cd` into the correct folder |
| `No such file or directory` | Typo in filename | Use `ls` to check the exact file name |
| `Permission denied` | Missing execute permission | Run `chmod +x Gradedtask.sh` |
| Cron job not running | Wrong file path | Use the **absolute path** of your script in crontab |

---

## 💡 Future Enhancements
- ☁️ Upload backups to **Google Drive / Dropbox / GitHub** automatically.  
- 📩 Email notification after successful backup.  
- 🧾 Log file to record backup history.  
- 🧰 Option to restore backups automatically.

---

## 🏁 Author
**Name:** Varsha P  
**Project:** Graded Task Automatic Backup  
**Category:** Bash Scripting / Linux Automation  
**Date:** November 2025  
