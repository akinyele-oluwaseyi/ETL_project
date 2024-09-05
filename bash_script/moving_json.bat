#!/bin/bash


# Directories
SOURCE_DIR="C:/Users/kamoflag/Documents/Raw/Files"  
DEST_DIR="C:/Users/kamoflag/Documents/Raw/Json_and_Csv"     

# Make the destination folder if it doesn't exist
mkdir -p $DEST_DIR

# Move all CSV and JSON files

echo "Moving CSV and JSON files..."

mv $SOURCE_DIR/*.csv $SOURCE_DIR/*.json $DEST_DIR/

# Check if the move was successful

if [[ $? -eq 0 ]]; then
  echo "Files moved successfully!"
else
  echo "Failed to move files."
  exit 1
fi
