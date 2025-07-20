#!/bin/bash

if [ -n "$3" ] 
then
  echo -e "Excessive Arguments specified.\n Format: ./finder.sh <filesdir> <searchstr>"
  exit 1
elif [ -z "$1" ]
then
  echo -e "First Argument Not Specified.\n Format: ./finder.sh <filesdir> <searchstr>"
  exit 1
elif [ -z "$2" ]
then
  echo -e "Second Argument Not Specified.\n Format: ./finder.sh <filesdir> <searchstr>"
  exit 1
else
  filesdir="$1"  # Directory to be searched for the string.
  searchstr="$2" # The string to be searched.
  
  if ! [ -d "$filesdir" ]
  then
    echo -e "Directory Specified does not exist"
    exit 1
  else
    total_files=$(find "$filesdir" -type f| wc -l)
    match_count=$(grep -r "$searchstr" "$filesdir" | wc -l) 
    echo -e "The number of files are $total_files and the number of matching lines are $match_count"
  fi
  
fi

