
#!/bin/bash

# step 1

echo "Extraction begins"
# Set the URL where the CSV is located

CSV_link="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"


# Create a RAW directory to save the file that would be downloaded

mkdir -p RAW

# Download the file and save it in the RAW directory

echo "Downloading the CSV file..."

curl -o RAW/annual_enterprise_survey_2023_financial_year_provisional.csv $CSV_link

# Check if the file was downloaded
if [[ -f "RAW/annual_enterprise_survey_2023_financial_year_provisional.csv" ]]; then
  echo "File downloaded successfully!"
else
  echo "Failed to download the file."
  exit 1
fi

# step 2

echo " Transformation Begins"

# making a directory named transformed and storing the new document within it.

mkdir -p Transformed

# Transform the file by changing the column name and selecting only specific columns
echo "Transforming the file..."
awk -F, 'BEGIN {OFS=","} NR==1 {for(i=1;i<=NF;i++) {if ($i=="Variable_code") $i="variable_code"}; print "Year,Value,Units,variable_code"} NR>1 {print $1,$9,$5,$6}' RAW/annual_enterprise_survey_2023_financial_year_provisional.csv > Transformed/2023_year_finance.csv

# Check if the transformation was successful
if [[ -f "Transformed/2023_year_finance.csv" ]]; then
  echo "File transformed successfully!"
else
  echo "Failed to transform the file."
  exit 1
fi

# Step 3: Loading
# Create a directory for the final data
mkdir -p Gold

# Move the transformed file to the 'Gold' directory
echo "Loading the transformed file into the Gold folder..."
cp Transformed/2023_year_finance.csv Gold/

# Check if the file was moved
if [[ -f "Gold/2023_year_finance.csv" ]]; then
  echo "File loaded successfully!"
else
  echo "Failed to load the file."
  exit 1
fi