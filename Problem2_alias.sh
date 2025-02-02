#!/bin/bash 
#terminal line to remove files: rm -r path to directoryorfile/* 

#bash script to remove all files in a targeted directory 

alias file_remove='function _file_remove() { 
if [ -z "$1"]; then 
echo "please provide path to directory or file"
return 1 
fi 

if [ -d "$1" ]; then 
echo "removing all files in directory $1" 
rm -f "$1"/* 
echo "All files in $1 removed" 
else 
echo "Error: $1 is not a valid directory" 
fi 
}; _file_remove'