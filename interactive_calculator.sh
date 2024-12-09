#!/bin/bash
# Interactive Calculator Script in Bash

# Function to perform the selected operation
calculate() {
    case $operation in
        1)
            result=$(echo "$num1 + $num2" | bc)
            echo "Result: $num1 + $num2 = $result"
            ;;
        2)
            result=$(echo "$num1 - $num2" | bc)
            echo "Result: $num1 - $num2 = $result"
            ;;
        3)
            result=$(echo "$num1 * $num2" | bc)
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
            echo "Invalid operation. Please choose a valid option."
            ;;
    esac
}

# Main interactive loop
while true; do
    echo "-------------------------"
    echo " Bash Interactive Calculator"
    echo "-------------------------"
    echo "1. Addition"
    echo "2. Subtraction"
    echo "3. Multiplication"
    echo "4. Division"
    echo "5. Exit"
    echo "-------------------------"

    # Prompt user to select an operation
    echo -n "Select an operation [1-5]: "
    read -r operation

    # Exit the script if the user chooses option 5
    if [ "$operation" -eq 5 ]; then
        echo "Exiting the calculator. Goodbye!"
        break
    fi

    # Take user inputs for the numbers
    echo -n "Enter the first number: "
    read -r num1
    echo -n "Enter the second number: "
    read -r num2

    # Call the calculate function
    calculate
    echo ""
done
