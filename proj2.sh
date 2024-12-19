#!/bin/bash

# Запрос ввода от пользователя
read -p "Введите слово: " inp
read -p "Введите длину пароля: " length

# Получение текущей даты
current_date=$(date)

# Конкатенация даты и введенного слова
combined_input="$current_date $inp"

# Генерация SHA-256 хэша и обрезка до нужной длины
PSWD=$(echo -n "$combined_input" | sha256sum | awk '{print $1}' | cut -c1-$length)

# Вывод результата
echo "Сгенерированный пароль: $PSWD"
