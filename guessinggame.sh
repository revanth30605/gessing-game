#!/usr/bin/env bash
# File: guessinggame.sh

# Function to check the user's guess
function check_guess {
    if [[ $1 -lt $2 ]]
    then
        echo "Your guess is too low. Try again!"
    elif [[ $1 -gt $2 ]]
    then
        echo "Your guess is too high. Try again!"
    else
        echo "🎉 Congratulations! You guessed it right: $2 files are in the directory."
    fi
}

# Count files in current directory
num_files=$(ls -1 | wc -l)
guess=-1

echo "============================="
echo " Welcome to the Guessing Game"
echo "============================="
echo "How many files do you think are in the current directory?"

# Loop until user guesses correctly
while [[ $guess -ne $num_files ]]
do
    read -p "Enter your guess: " guess
    if [[ $guess =~ ^[0-9]+$ ]]
    then
        check_guess $guess $num_files
    else
        echo "⚠️ Please enter a valid number."
        guess=-1
    fi
done
