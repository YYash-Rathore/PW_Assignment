#!/bin/bash

# Task 1: File Management Script
function file_management() {
    # Create a "backup" directory in the user's home directory
    mkdir -p ~/backup

    # Copy all .txt files from the current directory to the "backup" directory
    for file in *.txt; do
        cp "$file" ~/backup/"${file%.txt}_$(date +'%Y%m%d_%H%M%S').txt"
    done
    echo "Task 1: Backup complete!"
}

# Task 2: System Health Check
function system_health_check() {
    # Check CPU usage and memory usage
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    mem_usage=$(free | grep Mem | awk '{print ($3/$2) * 100.0}')

    # Log results to system_health.log
    echo "$(date) - CPU Usage: $cpu_usage%, Memory Usage: $mem_usage%" >> system_health.log

    # Check if CPU is above 80% or memory is below 20%
    if (( $(echo "$cpu_usage > 80" | bc -l) )) || (( $(echo "$mem_usage < 20" | bc -l) )); then
        echo "Warning: High CPU or low memory detected!" >> system_health.log
    fi

    echo "Task 2: System health check logged."
}

# Task 3: User Account Management
function user_account_management() {
    # Create users and generate random passwords
    while IFS= read -r username; do
        password=$(openssl rand -base64 12)
        sudo useradd "$username"
        echo "$username:$password" | sudo chpasswd
        echo "$username $password" >> credentials.txt
    done < user_list.txt
    echo "Task 3: User accounts created."
}

# Task 4: Automated Backup
function automated_backup() {
    # Take directory path as input
    read -p "Enter the directory path to backup: " dir

    # Compress the directory and save with a name including current date
    backup_name="backup_$(date +'%Y-%m-%d').tar.gz"
    tar -czf "$backup_name" "$dir"
    echo "Task 4: Backup saved as $backup_name"
}

# Task 5: Simple To-Do List
function todo_list() {
    todo_file="todo.txt"

    # Menu for adding, viewing, and removing tasks
    while true; do
        echo "1. Add Task"
        echo "2. View Tasks"
        echo "3. Remove Task"
        echo "4. Exit"
        read -p "Choose an option: " choice

        case $choice in
            1) 
                read -p "Enter task: " task
                echo "$task" >> "$todo_file"
                ;;
            2) 
                cat "$todo_file"
                ;;
            3) 
                read -p "Enter task to remove: " task
                sed -i "/$task/d" "$todo_file"
                ;;
            4) 
                break
                ;;
            *) 
                echo "Invalid option"
                ;;
        esac
    done
    echo "Task 5: To-do list updated."
}

# Task 6: Automated Software Installation
function software_installation() {
    # Install packages from a file
    while IFS= read -r package; do
        if command -v apt &> /dev/null; then
            sudo apt install -y "$package" && echo "$package installed" || echo "$package failed" >> install_log.txt
        elif command -v yum &> /dev/null; then
            sudo yum install -y "$package" && echo "$package installed" || echo "$package failed" >> install_log.txt
        fi
    done < packages.txt
    echo "Task 6: Software installation complete."
}

# Task 7: Text File Processing
function text_file_processing() {
    # Input text file
    read -p "Enter text file: " file

    # Count lines, words, and characters
    lines=$(wc -l < "$file")
    words=$(wc -w < "$file")
    chars=$(wc -m < "$file")

    # Find the longest word
    longest_word=$(awk '{ for(i=1;i<=NF;i++) if(length($i) > length(max)) max=$i } END { print max }' "$file")

    # Display the results
    echo "Lines: $lines"
    echo "Words: $words"
    echo "Characters: $chars"
    echo "Longest word: $longest_word"

    echo "Task 7: Text file processed."
}

# Main Menu
while true; do
    echo "Select a task to perform:"
    echo "1. File Management (Backup .txt files)"
    echo "2. System Health Check"
    echo "3. User Account Management"
    echo "4. Automated Backup"
    echo "5. Simple To-Do List"
    echo "6. Automated Software Installation"
    echo "7. Text File Processing"
    echo "8. Exit"
    read -p "Enter choice [1-8]: " task_choice

    case $task_choice in
        1) file_management ;;
        2) system_health_check ;;
        3) user_account_management ;;
        4) automated_backup ;;
        5) todo_list ;;
        6) software_installation ;;
        7) text_file_processing ;;
        8) echo "Exiting..."; break ;;
        *) echo "Invalid choice! Please select a valid option." ;;
    esac
done
