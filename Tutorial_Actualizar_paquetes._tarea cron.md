# Update Packages on Debian 11 with an Automated Script and a Cron Job:

## Step 1: Create the Package Update Script

Create a new text file in your editor of choice (e.g., Nano or Vim) with the following command:

```bash
nano update_pack.sh
```

Copy and paste the following code into the script file:


```markdown
# Update Packages on Debian 11 with an Automated Script and a Cron Job:

## Step 1: Create the Package Update Script

Create a new text file in your editor of choice (e.g., Nano or Vim) with the following command:

```bash
nano update_pack.sh
```

Copy and paste the following code into the script file:

```bash
#!/bin/bash

# Script to update the operating system packages

# Configure script exit options
set -e
set -o errexit  # Exit the script if a command fails
set -o nounset  # Exit the script if an undeclared variable is used

# Define variables
LOG_FILE="/var/log/update_pack.log"

# Function to handle errors
handle_error() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Error: $1 failed" | tee -a "$LOG_FILE"
    dmesg >> "$LOG_FILE"
    exit 1
}

# Function to check for available updates
check_updates() {
    local updates
    updates=$(apt-get -s upgrade | awk '/^[0-9]+ upgraded, [0-9]+ newly installed, [0-9]+ to remove and [0-9]+ not upgraded\./')

    if [[ -n "$updates" ]]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Updates available:" | tee -a "$LOG_FILE"
        echo "$updates" | tee -a "$LOG_FILE"
        return 0
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') - No updates available." | tee -a "$LOG_FILE"
        return 1
    fi
}

# Function to update packages
update_packages() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Starting package update..." | tee -a "$LOG_FILE"

    apt-get update >> "$LOG_FILE" 2>&1 || handle_error "Failed to update package list"
    apt-get upgrade -y >> "$LOG_FILE" 2>&1 || handle_error "Failed to upgrade packages"

    echo "$(date '+%Y-%m-%d %H:%M:%S') - Packages updated successfully." | tee -a "$LOG_FILE"
}

# Main function
main() {
    if check_updates; then
        update_packages
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Update process completed." | tee -a "$LOG_FILE"
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') - No update required." | tee -a "$LOG_FILE"
    fi
}

# Execute the main function
main

# End the script
exit 0

```

This script updates the operating system packages and logs any errors in a log file. Save the script file and exit the text editor.

Alternatively, you can do it with git:

```bash
git clone https://github.com/vhgalvez/Shell_bash.git
```

- Give execution permissions to the script file with the following command:

```bash
chmod +x update_packages.sh
```

## Step 2: Cron Jobs

Run the command `crontab -e` to open the cron job editor.

```bash
crontab -e
```

If this is your first time using crontab, you will be asked to choose a text editor. Select the editor you prefer.

Once you are in the cron job editor, add the following line at the end of the file:

```bash
0 0 * * * /path/to/script/update_packages.sh
```

This line indicates that the task will run at 12:00 a.m. (midnight) every day (0 0 * * *). The path `/path/to/script/` should be replaced with the full path where the `update_packages.sh` script is located.

Save the file and close the cron job editor.
```