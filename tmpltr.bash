#!/bin/bash

echo "Hello, choose what to do:
1) - scan the repository and add it to template's db"
read choice

# Correct if syntax and add spaces around brackets
if [ "$choice" == "1" ]; then
  source ./scan.bash
else
  echo "Invalid choice"
fi
