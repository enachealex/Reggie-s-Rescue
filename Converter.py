"""
Alex Enache
Assignment 1
This program will ask the user for a number value, then convert it from Fahrenheit into Kelvin
"""

# ask user for number value
try:
    fah = int(input("Enter a temperature in Fahrenheit: "))
except ValueError:
    print("Must be a number!")

# convert number into Kelvin
kelvin = (fah + 459.67) * 5/9

print("Your temperature in Kelvin is ", kelvin)
