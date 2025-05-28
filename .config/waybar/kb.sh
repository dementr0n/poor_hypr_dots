#!/bin/bash

# Замените на имя и адрес вашей клавиатуры
KEYBOARD_NAME="by-tech-gaming-keyboard"
# Получить данные о раскладке
LAYOUT=$(hyprctl -j devices | jq -r --arg name "$KEYBOARD_NAME"  '
    .keyboards[]
    | select(.name == $name)
    | .active_keymap
')

case "$LAYOUT" in
    "Russian") SHORT_LAYOUT="ru" ;;
    "English (US)") SHORT_LAYOUT="us" ;;
    # Добавьте другие раскладки при необходимости
    *) SHORT_LAYOUT="$LAYOUT" ;;  # Оставить оригинал, если не найдено
esac

echo "$SHORT_LAYOUT"
