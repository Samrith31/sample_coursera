#!/bin/bash

# A simple shell script to calculate simple interest

echo "Welcome to the Simple Interest Calculator!"

# Prompt for principal amount
read -p "Enter the principal amount (P): " principal

# Prompt for annual interest rate
read -p "Enter the annual interest rate (R in %): " rate

# Prompt for time period in years
read -p "Enter the time period in years (T): " time

# Validate inputs (basic check)
if ! [[ "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]] || \
   ! [[ "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]] || \
   ! [[ "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Please enter valid numbers for all inputs."
    exit 1
fi

# Calculate simple interest
# Formula: SI = (P * R * T) / 100
# Use 'bc' for floating-point arithmetic
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Calculate total amount
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

echo -e "\n--- Results ---"
echo "Principal Amount: $principal"
echo "Annual Interest Rate: $rate%"
echo "Time Period: $time years"
echo "Simple Interest: $simple_interest"
echo "Total Amount (Principal + Interest): $total_amount"
