#!/bin/bash

source ./tmpltr.sh

echo "Using config directory: $config_dir"

echo "Enter the template name:"
read tmpltname

json_file="$config_dir/$tmpltname.json"

# Check if the JSON file exists
if [ ! -f "$json_file" ]; then
    echo "The template $tmpltname does not exist."
    exit 1
fi

# Extract directories and files using jq
directories=($(jq -r '.directories[]' "$json_file"))
files=($(jq -r '.files[]' "$json_file"))

# Prompt for output directory
echo "Enter the output directory (leave blank for current directory):"
read output_dir

# Use current directory if no output directory is provided
if [ -z "$output_dir" ]; then
    output_dir="."
fi

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Output the directories and files
echo "Directories:"
for dir in "${directories[@]}"; do
    echo "- $dir"
    mkdir -p "$output_dir/$dir"  # Create the directory in the output directory
done

echo "Files:"
for file in "${files[@]}"; do
    echo "- $file"
    touch "$output_dir/$file"  # Create the file in the output directory
done

echo "Output written to: $output_dir"
