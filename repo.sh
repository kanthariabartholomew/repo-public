#!/bin/bash

# Number of commits to generate
NUM_COMMITS=12

# Start date (modify as needed)
START_DATE="2024-9-23T20:17:35+07:00"

# Convert start date to seconds
CURRENT_DATE=$(date -d "$START_DATE" +%s)

# Generate random commits
for ((i=1; i<=NUM_COMMITS; i++)); do
    # Generate a random time interval between 1 to 24 hours
    RANDOM_TIME=$((RANDOM % 86400 + 1))  # 1 to 86400 seconds (1 to 24 hours)
    
    # Update the date
    CURRENT_DATE=$((CURRENT_DATE + RANDOM_TIME))
    FORMATTED_DATE=$(date -d "@$CURRENT_DATE" --iso-8601=seconds)

    # Make a commit
    echo "Random commit $i" > file.txt
    git add file.txt
    GIT_COMMITTER_DATE="$FORMATTED_DATE" git commit -m "Commit text " --date="$FORMATTED_DATE"

    echo "Committed at: $FORMATTED_DATE"
done
git push origin main

