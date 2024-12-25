#!/bin/bash

# The following script is used to convert PNG to JPG, since JPG takes less space

if [ $# -eq 0 ]
then
    echo "$0 [File-1] [File-2] ... [File-n]"
    exit 1
fi

for i in "$@"
do
    if [ -f "$i" ]
    then
        # Извлечение имени файла без расширения
        f_n=`echo $i | sed "s/[.].*//"`

        # Конвертируем в формат JPG
        convert "$i" "$f_n.jpg"
        
        # Проверяем, был ли создан файл JPG
        if [ -f "$f_n.jpg" ]
        then
            # Удаляем исходный PNG файл
            rm "$i"
            echo "Deleted original file: $i"
        else
            echo "Failed to convert $i"
        fi
    else
        echo "$i is not a file"
    fi
done

echo "Files after conversion:"
ls

