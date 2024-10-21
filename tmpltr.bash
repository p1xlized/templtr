#!/bin/bash

echo "Hello, choose what to do:
1) - scan the repository and add it to template's db
2) -  create ainstance of the template
3) - List all the templates"
read choice
export config_dir="$HOME/.config/templtr/db"

# Correct if syntax and add spaces around brackets
if [ "$choice" == "1" ]; then
    source ./scan.bash
elif [  "$choice" == "2" ]; then
    source ./create.bash
elif [  "$choice" == "3" ]; then
    echo `ls $config_dir`
else
    echo "Invalid choice"
fi
