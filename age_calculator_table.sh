#!/bin/bash

# Smart Age Calculator with Table Format
# Author: Your Name
# Date: $(date)

calculate_age() {
    local birth_date=$1
    local current_date=$2

    # Convert input dates to seconds since epoch
    birth_seconds=$(date -d "$birth_date" +%s)
    current_seconds=$(date -d "$current_date" +%s)

    # Calculate the difference in seconds
    age_in_seconds=$((current_seconds - birth_seconds))

    if [ "$age_in_seconds" -lt 0 ]; then
        echo "Error: Birthdate is in the future!"
        exit 1
    fi

    # Convert age to other units
    age_in_minutes=$((age_in_seconds / 60))
    age_in_hours=$((age_in_minutes / 60))
    age_in_days=$((age_in_hours / 24))
    age_in_months=$((age_in_days / 30)) # Approximation
    age_in_years=$((age_in_days / 365)) # Approximation

    # Display the results in a table format
    echo -e "\n+----------------+-------------------------+"
    echo -e "|   UNIT         |       APPROXIMATE AGE   |"
    echo -e "+----------------+-------------------------+"
    printf "| Seconds        | %-23s |\n" "$age_in_seconds"
    printf "| Minutes        | %-23s |\n" "$age_in_minutes"
    printf "| Hours          | %-23s |\n" "$age_in_hours"
    printf "| Days           | %-23s |\n" "$age_in_days"
    printf "| Months         | %-23s |\n" "$age_in_months"
    printf "| Years          | %-23s |\n" "$age_in_years"
    echo -e "+----------------+-------------------------+\n"
}

# Main script starts here
echo "Welcome to the Smart Age Calculator!"
read -p "Enter your birthdate (YYYY-MM-DD): " birth_date
read -p "Enter the current date (YYYY-MM-DD) or press Enter for today: " current_date

# Default to today's date if no input is given
if [ -z "$current_date" ]; then
    current_date=$(date +%Y-%m-%d)
fi

# Validate input format
if ! date -d "$birth_date" >/dev/null 2>&1; then
    echo "Error: Invalid birthdate format! Please use YYYY-MM-DD."
    exit 1
fi

if ! date -d "$current_date" >/dev/null 2>&1; then
    echo "Error: Invalid current date format! Please use YYYY-MM-DD."
    exit 1
fi

# Call the function to calculate age
calculate_age "$birth_date" "$current_date"
