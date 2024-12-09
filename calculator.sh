#!/bin/bash
# Simple Calculator Script in Bash

# Function to display a menu
show_menu() {
    echo "-------------------------"
    echo " Simple Bash Calculator"
    echo "-------------------------"
    echo "1. Addition"
    echo "2. Subtraction"
    echo "3. Multiplication"
    echo "4. Division"
    echo "5. Exit"
    echo "-------------------------"
    echo -n "Enter your choice [1-5]: "
}

# Function to perform calculations
calculate() {
    case $operation in
        1) result=$(echo "$num1 + $num2" | bc);;
        2) result=$(echo "$num1 - $num2" | bc);;
        3) result=$(echo "$num1 * $num2" | bc);;
        4) 
            if [ "$num2" -eq 0 ]; then
                echo "Error: Division by zero is not allowed."
                return
            fi
            result=$(echo "scale=2; $num1 / $num2" | bc)
            ;;
        *) echo "Invalid operation selected"; return;;
    esac
    echo "Result: $result"
}

# Main script loop
while true; do
    show_menu
    read -r operation

    if [ "$operation" -eq 5 ]; then
        echo "Exiting calculator. Goodbye!"
        break
    fi

    echo -n "Enter the first number: "
    read -r num1
    echo -n "Enter the second number: "
    read -r num2

    calculate
    echo ""
done
