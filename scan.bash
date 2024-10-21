#!/bin/bash

# Ensure the output directory exists
config_dir="$HOME/.config/templtr/db"
mkdir -p "$config_dir"  # Creates the directory if it doesn't exist

# Prompt for the folder to scan
echo "Enter the folder to scan:"
read folder
echo "Enter the template name:"
read tmpltname

# Initialize arrays for files and directories
files=()
directories=()

# Check if the folder exists
if [ -d "$folder" ]; then
  # Loop through the items in the folder
  for item in "$folder"/*; do
    if [ -d "$item" ]; then
      directories+=("$(basename "$item")")
    elif [ -f "$item" ]; then
      files+=("$(basename "$item")")
    fi
  done
else
  echo "The folder $folder does not exist."
  exit 1
fi

# Manually construct the JSON output
json_output="{\"directories\": ["
first=true
for dir in "${directories[@]}"; do
  if [ "$first" = true ]; then
    json_output+="\"$dir\""
    first=false
  else
    json_output+=", \"$dir\""
  fi
done
json_output+="], \"files\": ["
first=true
for file in "${files[@]}"; do
  if [ "$first" = true ]; then
    json_output+="\"$file\""
    first=false
  else
    json_output+=", \"$file\""
  fi
done
json_output+="]}"

# Save the JSON output to ~/.config/templtr/dir.json
output_file="$config_dir/$tmpltname.json"
echo "$json_output" > "$output_file"

# Inform the user
echo "Directory contents saved to $output_file"
