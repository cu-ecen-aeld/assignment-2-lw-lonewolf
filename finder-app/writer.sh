#!/bin/bash

if [ -n "$3" ]
then 
  echo -e "Excessive Arguments passed.\n Syntax: ./writer.sh <filepath> <writestr>\n"
  exit 1
elif [ -z "$1" ]
then 
  echo -e "First Argument not Specified.\n Syntax: ./writer.sh <filepath> <writestr>\n"
  exit 1
elif [ -z "$2" ]
then
  echo -e "Second Arugment not Specified.\n Syntax: ./writer.sh <filepath> <writestr>\n"
  exit 1
else 
  writefile="$1" # Filename along with path to write to
  dirpath=$(dirname "$writefile") #Extracted path
  writestr="$2" #String to be written
  
  if ! mkdir -p "$dirpath"
  then 
    echo -e "Failed to create new directory\n"
    exit 1 
  fi 
  
 if ! echo "$writestr" > "$writefile"
 then 
   echo -e "Failed to write to the file"
   exit 1
 fi
fi
exit 0
