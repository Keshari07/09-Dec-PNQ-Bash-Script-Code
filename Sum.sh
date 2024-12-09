#!/bin/bash
# This script calculates the sum of two numbers provided by the user.

echo "Enter the first number:"
read num1
echo "Enter the second number:"
read num2

sum=$((num1 + num2))

echo "The sum of $num1 and $num2 is $sum."
