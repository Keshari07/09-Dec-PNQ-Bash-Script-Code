#!/bin/bash

# Function to draw a table
draw_table() {
    local label=$1
    local value=$2
    printf "| %-15s | %-15s |\n" "$label" "$value"
    printf "+-----------------+-----------------+\n"
}

# Get user input for the date of birth
read -p "Enter your date of birth (YYYY-MM-DD): " dob

# Validate the date input
if ! date -d "$dob" >/dev/null 2>&1; then
    echo "Invalid date format. Please use YYYY-MM-DD."
    exit 1
fi

# Current date
current_date=$(date +%s)

# Date of birth in seconds
dob_seconds=$(date -d "$dob" +%s)

# Calculate age in seconds
age_seconds=$((current_date - dob_seconds))

# Convert to other units
age_minutes=$((age_seconds / 60))
age_hours=$((age_minutes / 60))
age_days=$((age_hours / 24))
age_months=$((age_days / 30))  # Approximation
age_years=$((age_days / 365))  # Approximation

# Print the table
clear
printf "+-----------------+-----------------+\n"
printf "| Unit            | Value           |\n"
printf "+-----------------+-----------------+\n"
draw_table "Seconds" "$age_seconds"
draw_table "Minutes" "$age_minutes"
draw_table "Hours" "$age_hours"
draw_table "Days" "$age_days"
draw_table "Months" "$age_months"
draw_table "Years" "$age_years"

# End of script
