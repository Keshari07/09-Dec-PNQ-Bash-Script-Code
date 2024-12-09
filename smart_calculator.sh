#!/bin/bash
# Smart Calculator Script in Bash

# Function to calculate age
calculate_age() {
    echo -n "Enter your birth year (YYYY): "
    read -r birth_year
    current_year=$(date +"%Y")
    age=$((current_year - birth_year))
    echo "Your age is: $age years."
}

# Function for basic arithmetic operations
basic_calculator() {
    echo "Choose an operation:"
    echo "1. Addition"
    echo "2. Subtraction"
    echo "3. Multiplication"
    echo "4. Division"
    echo -n "Enter your choice: "
    read -r operation

    echo -n "Enter the first number: "
    read -r num1
    echo -n "Enter the second number: "
    read -r num2

    case $operation in
        1) result=$(echo "$num1 + $num2" | bc)
           echo "Result: $num1 + $num2 = $result"
           ;;
        2) result=$(echo "$num1 - $num2" | bc)
           echo "Result: $num1 - $num2 = $result"
           ;;
        3) result=$(echo "$num1 * $num2" | bc)
           echo "Result: $num1 * $num2 = $result"
           ;;
        4)
           if [ "$num2" -eq 0 ]; then
               echo "Error: Division by zero is not allowed."
           else
               result=$(echo "scale=2; $num1 / $num2" | bc)
               echo "Result: $num1 / $num2 = $result"
           fi
           ;;
        *)
           echo "Invalid operation selected!"
           ;;
    esac
}

# Function to calculate days between two dates
calculate_days_between_dates() {
    echo -n "Enter the first date (YYYY-MM-DD): "
    read -r date1
    echo -n "Enter the second date (YYYY-MM-DD): "
    read -r date2

    days_diff=$(( ($(date -d "$date2" +%s) - $(date -d "$date1" +%s)) / 86400 ))
    echo "The difference between $date1 and $date2 is $days_diff days."
}

# Main Menu
while true; do
    echo "--------------------------------"
    echo " Smart Calculator Menu"
    echo "--------------------------------"
    echo "1. Calculate Age"
    echo "2. Basic Arithmetic Operations"
    echo "3. Calculate Days Between Two Dates"
    echo "4. Exit"
    echo "--------------------------------"

    echo -n "Enter your choice [1-4]: "
    read -r choice

    case $choice in
        1)
            calculate_age
            ;;
        2)
            basic_calculator
            ;;
        3)
            calculate_days_between_dates
            ;;
        4)
            echo "Exiting the Smart Calculator. Goodbye!"
            break
            ;;
        *)
            echo "Invalid choice! Please choose a valid option."
            ;;
    esac
    echo ""
done
