#!/bin/bash

# Export the config directory
export config_dir="$HOME/.config/templtr/db"


if [[ $1 == "-s" ]]; then
    source ./scan.bash
    exit 0
elif [[ $1 == "-c" ]]; then
    source ./create.bash
    exit 0
elif [[ $1 == "-l" ]]; then
    echo "Templates:"
    ls "$config_dir"
    exit 0
fi

# Present the menu if nothing is provided
echo "Hello, choose what to do:
1) - Scan the repository and add it to the template's db
2) - Create an instance of the template
3) - List all the templates"
read -p "Enter your choice: " choice

# Correct if syntax and add spaces around brackets
if [ "$choice" == "1" ]; then
    source ./scan.bash
elif [ "$choice" == "2" ]; then
    source ./create.bash
elif [ "$choice" == "3" ]; then
    echo "Templates:"
    ls "$config_dir"
else
    echo "Invalid choice"
fi
