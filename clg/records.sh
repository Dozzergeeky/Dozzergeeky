#!/bin/bash

# Function to display records of students in a given department
display_records() {
    awk -v dept="$1" '{if (tolower($4) == tolower(dept)) print}' record.txt
}

# Function to count the number of students in a given department
count_students() {
    grep -ic "$1" record.txt
}

# Function to count the number of girl students in a given department
count_girl_students() {
    grep -i "$1" record.txt | grep -c "F"
}

# Display records of students in the CSE department
echo "i) Records of students in the CSE dept:"
display_records "CSE"

# Count the number of students in the CSE department
echo "ii) Number of students in the CSE dept:"
count_students "CSE"

# Display records of students in the IT department
echo "iii) Records of students in the IT dept:"
display_records "IT"

# Display records of students not in the CSE department
echo "iv) Records of students not in the CSE dept:"
grep -vi "CSE" record.txt

# Count the number of girl students in the CSE department
echo "v) Number of girl students in the CSE dept:"
count_girl_students "CSE"

# Display records of girl students in the CSE department
echo "vi) Records of girl students in the CSE dept:"
grep -i "CSE" record.txt | grep -i "F"

