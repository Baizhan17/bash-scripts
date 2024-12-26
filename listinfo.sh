#!/bin/bash

if [ $# -eq 0 ]; then 
    echo "Usage: ./listinfo.sh <filename>"
    exit 1
fi

if [ ! -e "$1" ]; then
    echo "File $1 does not exist."
    exit 1
fi

OWNER=$(ls -l "$1" | awk '{print $3}')
SIZE=$(ls -l "$1" | awk '{print $5}')
SIZE_MB=$(echo "scale=2; $SIZE/1024/1024" | bc) # Конвертируем размер в МБ
CREATED_AT=$(stat -c '%y' "$1" | awk '{print $1, $2}') # Используем `stat` для получения даты создания
FILETYPE=$(file "$1" | cut -d':' -f2)

echo "File: $1"
echo "Owner: $OWNER"
echo "Size: $SIZE_MB MB"
echo "Created at: $CREATED_AT"
echo "The file is: $FILETYPE"

if [ -r "$1" ]; then
    echo "The file is readable"
else
    echo "Not readable"
fi

if [ -w "$1" ]; then
    echo "The file is writeable"
else
    echo "Not writeable"
fi

if [ -x "$1" ]; then
    echo "The file is executable"
else
    echo "Not executable"
fi

